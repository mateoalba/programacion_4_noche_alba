import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  Timer? _timer;
  int  _segundos = 0;
  bool _pausado  = false;
  final List<int> _tiemposVuelta = [];

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _segundos++);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer?.cancel();
      } else {
        _iniciarTimer();
      }
    });
  }

  void _vuelta() {
    if (!_pausado && mounted) {
      setState(() => _tiemposVuelta.add(_segundos));
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formato(int totalSegundos) {
    final h = totalSegundos ~/ 3600;
    final m = (totalSegundos % 3600) ~/ 60;
    final s = totalSegundos % 60;
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Color get _colorTiempo {
    if (_segundos > 120) return Colors.deepPurple;
    if (_segundos > 60) return Colors.red;
    if (_segundos > 30) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formato(_segundos),
          style: TextStyle(
            fontSize:   40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color:      _colorTiempo,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon:  Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: _pausado ? null : _vuelta,
              icon: const Icon(Icons.flag, size: 18),
              label: const Text('Vuelta'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() {
                _timer?.cancel();
                _segundos = 0;
                _pausado  = false;
                _tiemposVuelta.clear();
                _iniciarTimer();
              }),
              child: const Text('Reiniciar'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _pausado ? 'Pausado' : 'Corriendo',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        if (_tiemposVuelta.isNotEmpty) ...[
          const SizedBox(height: 12),
          const Text('Tiempos de vuelta:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          for (int i = 0; i < _tiemposVuelta.length; i++)
            Text(
              'Vuelta ${i + 1}: ${_formato(_tiemposVuelta[i])}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
        ],
      ],
    );
  }
}
