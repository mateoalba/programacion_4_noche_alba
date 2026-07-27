import 'package:flutter/material.dart';

/// Widget StatefulWidget que cuenta pasajeros abordados con límite configurable.
/// Muestra una barra de progreso y cambia de color al alcanzar el límite.
class ContadorPasajeros extends StatefulWidget {
  final String       etiqueta;
  final int          limite;
  final Color        color;
  final String       textoBoton;
  final int          pasoIncremento;
  final VoidCallback? onLimite;

  const ContadorPasajeros({
    super.key,
    required this.etiqueta,
    this.limite  = 180,
    this.color   = Colors.blue,
    this.textoBoton = 'Abordar',
    this.pasoIncremento = 1,
    this.onLimite,
  });

  @override
  State<ContadorPasajeros> createState() => _ContadorPasajerosState();
}

class _ContadorPasajerosState extends State<ContadorPasajeros> {
  int _valor = 0;

  void _incrementar() {
    if (_valor >= widget.limite) return;
    setState(() => _valor += widget.pasoIncremento);
    if (_valor >= widget.limite) {
      widget.onLimite?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final enLimite  = _valor >= widget.limite;
    final progreso  = _valor / widget.limite;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.etiqueta,
            style: TextStyle(color: widget.color, fontWeight: FontWeight.w600)),

        const SizedBox(height: 4),

        LinearProgressIndicator(
          value:           progreso.clamp(0.0, 1.0),
          color:           enLimite ? Colors.red : widget.color,
          backgroundColor: widget.color.withValues(alpha: 0.15),
        ),

        const SizedBox(height: 4),

        Text(
          '$_valor / ${widget.limite}',
          style: TextStyle(
            fontSize:   28,
            fontWeight: FontWeight.bold,
            color:      enLimite ? Colors.red : widget.color,
          ),
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              onPressed: enLimite ? null : _incrementar,
              child: Text(widget.textoBoton),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() => _valor = 0),
              child: const Text('Reiniciar'),
            ),
          ],
        ),

        if (enLimite)
          Text('Abordaje completo',
              style: TextStyle(fontSize: 12, color: Colors.red.shade700)),
      ],
    );
  }
}
