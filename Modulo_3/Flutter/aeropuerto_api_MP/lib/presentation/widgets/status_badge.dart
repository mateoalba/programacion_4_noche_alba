import 'package:flutter/material.dart';
import '../../../core/utils/formatters.dart';

class StatusBadge extends StatelessWidget {
  final String estado;
  final bool pequeno;

  const StatusBadge({
    super.key,
    required this.estado,
    this.pequeno = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = Formatters.estadoVueloColor(estado);
    final icon = Formatters.estadoVueloIcon(estado);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: pequeno ? 8 : 12,
        vertical: pequeno ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: pequeno ? 12 : 14, color: color),
          SizedBox(width: pequeno ? 4 : 6),
          Text(
            Formatters.formatEstadoVuelo(estado),
            style: TextStyle(
              color: color,
              fontSize: pequeno ? 10 : 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
