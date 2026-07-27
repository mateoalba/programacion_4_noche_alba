import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/dashboard_provider.dart';
import '../../widgets/admin_shell.dart';
import '../../widgets/kpi_card.dart';
import '../../../theme/app_colors.dart';
import '../../../core/utils/formatters.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardProvider);

    return AdminShell(
      child: state.cargando
          ? const Center(
              child:
                  CircularProgressIndicator(color: AppColors.primary))
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(dashboardProvider.notifier).recargar(),
              color: AppColors.primary,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    'Resumen del Día',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Panel de control en tiempo real',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.4,
                    children: [
                      KpiCard(
                        titulo: 'Total Vuelos',
                        valor: state.totalVuelos.toString(),
                        icono: Icons.flight,
                        color: AppColors.primary,
                      ),
                      KpiCard(
                        titulo: 'En Vuelo',
                        valor: state.vuelosEnVuelo.toString(),
                        icono: Icons.flight,
                        color: AppColors.accent,
                      ),
                      KpiCard(
                        titulo: 'Retrasados',
                        valor: state.vuelosRetrasados.toString(),
                        icono: Icons.access_time_filled,
                        color: AppColors.warning,
                      ),
                      KpiCard(
                        titulo: 'Cancelados',
                        valor: state.vuelosCancelados.toString(),
                        icono: Icons.cancel,
                        color: AppColors.error,
                      ),
                      KpiCard(
                        titulo: 'Programados',
                        valor: state.vuelosProgramados.toString(),
                        icono: Icons.schedule,
                        color: AppColors.info,
                      ),
                      KpiCard(
                        titulo: 'Aterrizados',
                        valor: state.vuelosAterrizados.toString(),
                        icono: Icons.flight_land,
                        color: AppColors.success,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Embarque de Pasajeros',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tasa de Ocupación',
                                    style: TextStyle(
                                      color: AppColors
                                          .textSecondaryDark,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    Formatters.formatOcupacion(
                                        state.tasaOcupacion),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.accent,
                                    ),
                                  ),
                                ],
                              ),
                              CircularProgressIndicator(
                                value: state.tasaOcupacion
                                    .clamp(0.0, 1.0),
                                strokeWidth: 8,
                                backgroundColor:
                                    AppColors.inputDark,
                                color: state.tasaOcupacion > 0.8
                                    ? AppColors.warning
                                    : AppColors.primary,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _pasajeroStat(
                                'Abordados',
                                state.pasajerosAbordados,
                                AppColors.success,
                              ),
                              _pasajeroStat(
                                'Pendientes',
                                state.pasajerosPendientes,
                                AppColors.info,
                              ),
                              _pasajeroStat(
                                'Ausentes',
                                state.pasajerosAusentes,
                                AppColors.error,
                              ),
                              _pasajeroStat(
                                'Total',
                                state.totalPasajeros,
                                AppColors.textSecondaryDark,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state.vuelosPorEstado.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    const Text(
                      'Vuelos por Estado',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: state.vuelosPorEstado.map((item) {
                            final estado =
                                item['estado'] as String? ?? '';
                            final cantidad =
                                item['cantidad'] as int? ?? 0;
                            final color =
                                Formatters.estadoVueloColor(estado);
                            final total = state.totalVuelos > 0
                                ? cantidad / state.totalVuelos
                                : 0.0;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(
                                      vertical: 6),
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
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      Formatters
                                          .formatEstadoVuelo(
                                              estado),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors
                                            .textPrimaryDark,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(
                                              4),
                                      child:
                                          LinearProgressIndicator(
                                        value: total.clamp(
                                            0.0, 1.0),
                                        minHeight: 8,
                                        backgroundColor:
                                            AppColors.inputDark,
                                        color: color,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    cantidad.toString(),
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight:
                                          FontWeight.bold,
                                      color: color,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                ],
              ),
            ),
    );
  }

  Widget _pasajeroStat(String label, int valor, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            valor.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondaryDark,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
