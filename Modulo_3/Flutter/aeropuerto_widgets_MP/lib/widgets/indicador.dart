import 'package:flutter/material.dart';

class Indicador extends StatelessWidget {
  final String  label;
  final String  valor;
  final Color   color;
  final String? subtitulo;
  final IconData? icono;
  final double  opacidad;
  final bool    centrado;

  const Indicador({
    super.key,
    required this.label,
    required this.valor,
    required this.color,
    this.subtitulo,
    this.icono,
    this.opacidad = 1.0,
    this.centrado = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacidad,
      child: Column(
        crossAxisAlignment: centrado ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisSize:       MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icono != null) ...[
                Icon(icono, size: 22, color: color),
                const SizedBox(width: 4),
              ],
              Text(
                valor,
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          Text(label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              textAlign: centrado ? TextAlign.center : TextAlign.start),
          if (subtitulo != null)
            Text(subtitulo!,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
                textAlign: centrado ? TextAlign.center : TextAlign.start),
        ],
      ),
    );
  }
}
