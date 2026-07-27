import 'package:flutter/material.dart';
import '../../../domain/model/pasajero.dart';
import '../../../core/utils/formatters.dart';
import '../../../theme/app_colors.dart';

class PasajeroCard extends StatelessWidget {
  final Pasajero pasajero;
  final VoidCallback? onTap;
  final Function(String)? onEstadoChanged;

  const PasajeroCard({
    super.key,
    required this.pasajero,
    this.onTap,
    this.onEstadoChanged,
  });

  @override
  Widget build(BuildContext context) {
    final estadoColor = _colorEstado(pasajero.estadoEmbarque);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: pasajero.vip
                    ? AppColors.accent
                    : AppColors.primary.withValues(alpha: 0.2),
                radius: 24,
                child: Text(
                  '${pasajero.nombre.isNotEmpty ? pasajero.nombre[0] : ''}'
                  '${pasajero.apellido.isNotEmpty ? pasajero.apellido[0] : ''}',
                  style: TextStyle(
                    color: pasajero.vip ? Colors.black : AppColors.primaryLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            pasajero.nombreCompleto,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.textPrimaryDark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (pasajero.vip)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.accent.withValues(alpha: 0.3)),
                            ),
                            child: const Text(
                              'VIP',
                              style: TextStyle(
                                color: AppColors.accent,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.airline_seat_recline_normal,
                            size: 14, color: AppColors.textSecondaryDark),
                        const SizedBox(width: 4),
                        Text(
                          'Asiento ${pasajero.asiento}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondaryDark,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.confirmation_number,
                            size: 14, color: AppColors.textSecondaryDark),
                        const SizedBox(width: 4),
                        Text(
                          pasajero.vueloCodigo,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${Formatters.formatTipoDocumento(pasajero.tipoDocumento)}: ${pasajero.documento}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textDisabledDark,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: estadoColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: estadoColor),
                    ),
                    child: Text(
                      Formatters.formatEstadoEmbarque(pasajero.estadoEmbarque),
                      style: TextStyle(
                        color: estadoColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (onEstadoChanged != null) ...[
                    const SizedBox(height: 8),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, size: 18),
                      onSelected: onEstadoChanged,
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'pendiente',
                          child: Text('Pendiente'),
                        ),
                        const PopupMenuItem(
                          value: 'abordado',
                          child: Text('Abordado'),
                        ),
                        const PopupMenuItem(
                          value: 'ausente',
                          child: Text('Ausente'),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _colorEstado(String estado) {
    switch (estado) {
      case 'abordado':
        return AppColors.success;
      case 'pendiente':
        return AppColors.info;
      case 'ausente':
        return AppColors.error;
      default:
        return AppColors.textSecondaryDark;
    }
  }
}
