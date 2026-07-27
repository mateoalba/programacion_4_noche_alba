import 'package:flutter/material.dart';
import '../../../core/utils/formatters.dart';
import '../../../theme/app_colors.dart';

class FiltersSheet extends StatefulWidget {
  final String? estadoActual;
  final String? aerolineaActual;
  final Function(String? estado, String? aerolinea) onAplicar;
  final VoidCallback onLimpiar;

  const FiltersSheet({
    super.key,
    this.estadoActual,
    this.aerolineaActual,
    required this.onAplicar,
    required this.onLimpiar,
  });

  @override
  State<FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<FiltersSheet> {
  String? _estadoSeleccionado;
  String? _aerolineaSeleccionada;

  final _estados = [
    'programado',
    'abordando',
    'en_vuelo',
    'retrasado',
    'cancelado',
    'aterrizado',
    'embarque',
  ];

  final _aerolineas = [
    'Avianca',
    'LATAM',
    'Viva Air',
    'Wingo',
    'Copa Airlines',
    'American Airlines',
    'Delta',
    'United',
  ];

  @override
  void initState() {
    super.initState();
    _estadoSeleccionado = widget.estadoActual;
    _aerolineaSeleccionada = widget.aerolineaActual;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filtros',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryDark,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _estadoSeleccionado = null;
                    _aerolineaSeleccionada = null;
                  });
                  widget.onLimpiar();
                  Navigator.pop(context);
                },
                child: const Text('Limpiar todo'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Estado del Vuelo',
            style: TextStyle(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _estados.map((estado) {
              final seleccionado = _estadoSeleccionado == estado;
              return ChoiceChip(
                label: Text(Formatters.formatEstadoVuelo(estado)),
                selected: seleccionado,
                onSelected: (selected) {
                  setState(() {
                    _estadoSeleccionado = selected ? estado : null;
                  });
                },
                selectedColor:
                    AppColors.primary.withValues(alpha: 0.3),
                labelStyle: TextStyle(
                  color: seleccionado
                      ? AppColors.primaryLight
                      : AppColors.textSecondaryDark,
                  fontWeight:
                      seleccionado ? FontWeight.bold : FontWeight.normal,
                ),
                side: BorderSide(
                  color: seleccionado
                      ? AppColors.primary
                      : AppColors.borderDark,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text(
            'Aerolínea',
            style: TextStyle(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _aerolineas.map((aerolinea) {
              final seleccionado = _aerolineaSeleccionada == aerolinea;
              return ChoiceChip(
                label: Text(aerolinea),
                selected: seleccionado,
                onSelected: (selected) {
                  setState(() {
                    _aerolineaSeleccionada = selected ? aerolinea : null;
                  });
                },
                selectedColor:
                    AppColors.accent.withValues(alpha: 0.3),
                labelStyle: TextStyle(
                  color: seleccionado
                      ? AppColors.accent
                      : AppColors.textSecondaryDark,
                  fontWeight:
                      seleccionado ? FontWeight.bold : FontWeight.normal,
                ),
                side: BorderSide(
                  color: seleccionado
                      ? AppColors.accent
                      : AppColors.borderDark,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              widget.onAplicar(_estadoSeleccionado, _aerolineaSeleccionada);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text(
              'Aplicar Filtros',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
