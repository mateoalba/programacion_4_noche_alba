import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/vuelos_provider.dart';
import '../../widgets/status_badge.dart';
import '../../../domain/model/vuelo.dart';
import '../../../core/utils/formatters.dart';
import '../../../theme/app_colors.dart';

class VueloDetailScreen extends ConsumerStatefulWidget {
  final String vueloId;

  const VueloDetailScreen({super.key, required this.vueloId});

  @override
  ConsumerState<VueloDetailScreen> createState() =>
      _VueloDetailScreenState();
}

class _VueloDetailScreenState extends ConsumerState<VueloDetailScreen> {
  Vuelo? _vuelo;
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarVuelo();
  }

  Future<void> _cargarVuelo() async {
    final notifier = ref.read(vuelosProvider.notifier);
    final vuelo = notifier.obtenerVueloPorId(widget.vueloId);
    if (vuelo != null) {
      setState(() {
        _vuelo = vuelo;
        _cargando = false;
      });
    } else {
      try {
        final ds = ref.read(vueloDatasourceProvider);
        final v = await ds.obtenerVueloPorId(widget.vueloId);
        setState(() {
          _vuelo = v;
          _cargando = false;
        });
      } catch (e) {
        setState(() => _cargando = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cargando) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalle de Vuelo')),
        body: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    final vuelo = _vuelo;
    if (vuelo == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalle de Vuelo')),
        body: const Center(
          child: Text('Vuelo no encontrado',
              style: TextStyle(color: AppColors.textSecondaryDark)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Vuelo ${vuelo.codigo}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    vuelo.codigo,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryLight,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 8),
                    Text(
                     vuelo.aerolineaNombre.isNotEmpty
                         ? vuelo.aerolineaNombre
                         : vuelo.aerolinea,
                     style: const TextStyle(
                       fontSize: 16,
                       color: AppColors.textSecondaryDark,
                     ),
                   ),
                  const SizedBox(height: 12),
                  StatusBadge(estado: vuelo.estado),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _ciudadDetalle(
                            vuelo.origenCodigo.isNotEmpty
                                ? vuelo.origenCodigo
                                : vuelo.origen,
                            'Origen',
                            Icons.flight_takeoff,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 1,
                                color: AppColors.textDisabledDark,
                              ),
                              const SizedBox(height: 4),
                              Icon(
                                vuelo.estaEnVuelo
                                    ? Icons.flight
                                    : Icons.flight_land,
                                color: AppColors.accent,
                                size: 24,
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: 60,
                                height: 1,
                                color: AppColors.textDisabledDark,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: _ciudadDetalle(
                            vuelo.destinoCodigo.isNotEmpty
                                ? vuelo.destinoCodigo
                                : vuelo.destino,
                            'Destino',
                            Icons.flight_land,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Información del Vuelo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _infoRow(
                        Icons.schedule, 'Salida',
                        Formatters.formatFechaHora(vuelo.fechaSalida)),
                    if (vuelo.fechaLlegada != null)
                      _infoRow(Icons.schedule, 'Llegada',
                          Formatters.formatFechaHora(vuelo.fechaLlegada!)),
                    _infoRow(Icons.door_front_door, 'Puerta',
                        vuelo.puertaCodigo.isNotEmpty ? vuelo.puertaCodigo : vuelo.puerta),
                    _infoRow(Icons.flag, 'Estado',
                        Formatters.formatEstadoVuelo(vuelo.estado)),
                    _infoRow(
                      Icons.language,
                      'Tipo',
                      vuelo.internacional
                          ? 'Internacional'
                          : 'Nacional',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ocupación',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${vuelo.pasajeros} / ${vuelo.capacidad}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryLight,
                          ),
                        ),
                        Text(
                          Formatters.formatOcupacion(vuelo.ocupacion),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: vuelo.estaLleno
                                ? AppColors.error
                                : AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: vuelo.ocupacion.clamp(0.0, 1.0),
                        minHeight: 12,
                        backgroundColor: AppColors.inputDark,
                        color: vuelo.estaLleno
                            ? AppColors.error
                            : vuelo.ocupacion > 0.8
                                ? AppColors.warning
                                : AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${vuelo.asientosDisponibles} asientos disponibles',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondaryDark,
                          ),
                        ),
                        if (vuelo.estaLleno)
                          const Text(
                            'VUELO LLENO',
                            style: TextStyle(
                              color: AppColors.error,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ciudadDetalle(String ciudad, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.textSecondaryDark, size: 20),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondaryDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          ciudad,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimaryDark,
          ),
        ),
      ],
    );
  }

  Widget _infoRow(IconData icon, String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondaryDark),
          const SizedBox(width: 12),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondaryDark,
              ),
            ),
          ),
          Expanded(
            child: Text(
              valor,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
