import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/model/vuelo.dart';
import '../../../core/utils/formatters.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class VueloCard extends StatelessWidget {
  final Vuelo vuelo;
  final bool esAdmin;

  const VueloCard({
    super.key,
    required this.vuelo,
    this.esAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    final estadoColor = Formatters.estadoVueloColor(vuelo.estado);
    final estadoIcon = Formatters.estadoVueloIcon(vuelo.estado);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (esAdmin) {
            context.go('/admin/vuelos/detalle/${vuelo.id}');
          } else {
            context.go('/vuelos/detalle/${vuelo.id}');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: estadoColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: estadoColor, width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(estadoIcon, size: 14, color: estadoColor),
                        const SizedBox(width: 4),
                        Text(
                          Formatters.formatEstadoVuelo(vuelo.estado),
                          style: TextStyle(
                            color: estadoColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (vuelo.internacional)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: AppColors.accent.withValues(alpha: 0.3)),
                      ),
                      child: const Text(
                        'INT',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (vuelo.esCritico)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.warning_amber,
                          color: AppColors.warning, size: 18),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    vuelo.codigo,
                    style: AppTextStyles.codigoVueloDark,
                  ),
                  const SizedBox(width: 12),
                    Expanded(
                    child: Text(
                      vuelo.aerolineaNombre.isNotEmpty
                          ? vuelo.aerolineaNombre
                          : vuelo.aerolinea,
                      style: AppTextStyles.cuerpoSecundarioDark,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _ciudadInfo(vuelo.origenCodigo.isNotEmpty ? vuelo.origenCodigo : vuelo.origen, 'Origen'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 40,
                          height: 1,
                          color: AppColors.textDisabledDark,
                        ),
                        Icon(
                          Icons.flight,
                          size: 18,
                          color: estadoColor,
                        ),
                        Container(
                          width: 40,
                          height: 1,
                          color: AppColors.textDisabledDark,
                        ),
                      ],
                    ),
                  ),
                  _ciudadInfo(vuelo.destinoCodigo.isNotEmpty ? vuelo.destinoCodigo : vuelo.destino, 'Destino', esDerecha: true),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoItem(Icons.schedule, Formatters.formatHora(vuelo.fechaSalida)),
                  _infoItem(Icons.door_front_door, 'Puerta ${vuelo.puertaCodigo.isNotEmpty ? vuelo.puertaCodigo : vuelo.puerta}'),
                  _infoItem(
                    Icons.people,
                    '${vuelo.pasajerosAbordados}/${vuelo.capacidad}',
                  ),
                  _infoItem(Icons.airline_seat_recline_normal,
                      '${vuelo.asientosDisponibles} libres'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ciudadInfo(String ciudad, String label, {bool esDerecha = false}) {
    return Column(
      crossAxisAlignment:
          esDerecha ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.textSecondaryDark,
          ),
        ),
        Text(
          ciudad,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimaryDark,
          ),
        ),
      ],
    );
  }

  Widget _infoItem(IconData icon, String texto) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondaryDark),
        const SizedBox(width: 4),
        Text(
          texto,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondaryDark,
          ),
        ),
      ],
    );
  }
}
