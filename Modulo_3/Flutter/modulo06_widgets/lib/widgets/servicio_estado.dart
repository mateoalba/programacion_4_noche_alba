import 'package:flutter/material.dart';

class ServicioEstado extends StatefulWidget {
  final String nombre;
  const ServicioEstado({super.key, required this.nombre});

  @override
  State<ServicioEstado> createState() => _ServicioEstadoState();
}

class _ServicioEstadoState extends State<ServicioEstado> {
  bool _activo = true;
  int  _reinicios = 0;
  String _nivel = 'normal';

  static const int _maxReinicios = 3;

  void _toggle() {
    setState(() {
      _activo = !_activo;
      if (_activo) {
        _reinicios++;
        if (_reinicios >= _maxReinicios) {
          _nivel = 'critico';
        } else if (_reinicios >= 1) {
          _nivel = 'warning';
        }
      }
    });
  }

  void _reset() {
    setState(() {
      _activo = true;
      _reinicios = 0;
      _nivel = 'normal';
    });
  }

  Color get _colorIcono {
    return switch (_nivel) {
      'critico' => Colors.red,
      'warning' => Colors.orange,
      _         => Colors.green,
    };
  }

  IconData get _icono {
    return switch (_nivel) {
      'critico' => Icons.cancel,
      'warning' => Icons.warning_amber,
      _         => Icons.check_circle,
    };
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reinicios >= _maxReinicios;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(_icono, size: 72, color: _colorIcono),
          const SizedBox(height: 8),

          Text(widget.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

          Text(
            _activo ? 'En línea' : 'Fuera de línea',
            style: TextStyle(
              fontSize:   15,
              fontWeight: FontWeight.w600,
              color:      _activo ? Colors.green.shade700 : Colors.red.shade700,
              fontStyle:  _activo ? FontStyle.normal : FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),

          if (!_activo)
            Container(
              margin:     const EdgeInsets.only(bottom: 16),
              padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:        Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border:       Border.all(color: Colors.red.shade300),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber, color: Colors.red, size: 16),
                  SizedBox(width: 6),
                  Text('Requiere atención',
                      style: TextStyle(color: Colors.red, fontSize: 13)),
                ],
              ),
            ),

          FilledButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(_activo ? Icons.stop : Icons.play_arrow),
            label: Text(_activo ? 'Detener servicio' : 'Iniciar servicio'),
            style: FilledButton.styleFrom(
              backgroundColor: _activo ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
          const SizedBox(height: 12),

          Opacity(
            opacity: enLimite ? 0.1 : 1.0,
            child: Text(
              'Reinicios: $_reinicios / $_maxReinicios',
              style: TextStyle(
                fontSize: 13,
                color:    enLimite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),

          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de reinicios alcanzado',
                style: TextStyle(
                    fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),
              ),
            ),

          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: _reset,
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Reiniciar estado'),
          ),
        ],
      ),
    );
  }
}
