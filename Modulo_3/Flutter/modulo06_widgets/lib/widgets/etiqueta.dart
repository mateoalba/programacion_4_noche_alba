import 'package:flutter/material.dart';

class Etiqueta extends StatelessWidget {
  final String  texto;
  final Color   color;
  final double  fontSize;
  final bool    relleno;
  final IconData? icono;
  final bool    rectangular;

  const Etiqueta({
    super.key,
    required this.texto,
    required this.color,
    this.fontSize = 13,
    this.relleno  = false,
    this.icono,
    this.rectangular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: relleno
            ? LinearGradient(
                colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.25)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: relleno ? null : color.withValues(alpha: 0.12),
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(rectangular ? 4 : 20),
        boxShadow: [
          BoxShadow(
            color:      color.withValues(alpha: 0.2),
            blurRadius: 6,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icono != null) ...[
            Icon(icono, size: fontSize + 2, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            texto,
            style: TextStyle(
              color:      color,
              fontWeight: FontWeight.w600,
              fontSize:   fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
