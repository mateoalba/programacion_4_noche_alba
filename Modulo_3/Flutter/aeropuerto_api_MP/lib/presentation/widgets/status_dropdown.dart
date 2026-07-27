import 'package:flutter/material.dart';
import '../../../core/utils/formatters.dart';

class StatusDropdown extends StatelessWidget {
  final String estadoActual;
  final Function(String) onChanged;

  const StatusDropdown({
    super.key,
    required this.estadoActual,
    required this.onChanged,
  });

  static const _estados = [
    'programado',
    'abordando',
    'en_vuelo',
    'retrasado',
    'cancelado',
    'aterrizado',
    'embarque',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: estadoActual,
      decoration: InputDecoration(
        labelText: 'Estado del Vuelo',
        prefixIcon: Icon(
          Formatters.estadoVueloIcon(estadoActual),
          color: Formatters.estadoVueloColor(estadoActual),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      items: _estados.map((e) {
        final color = Formatters.estadoVueloColor(e);
        return DropdownMenuItem(
          value: e,
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(Formatters.formatEstadoVuelo(e)),
            ],
          ),
        );
      }).toList(),
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}
