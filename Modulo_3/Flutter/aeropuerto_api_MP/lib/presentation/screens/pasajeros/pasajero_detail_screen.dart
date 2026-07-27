import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/pasajeros_provider.dart';
import '../../../domain/model/pasajero.dart';
import '../../../core/utils/formatters.dart';
import '../../../theme/app_colors.dart';
import '../../widgets/status_badge.dart';

class PasajeroDetailScreen extends ConsumerStatefulWidget {
  final String pasajeroId;

  const PasajeroDetailScreen({super.key, required this.pasajeroId});

  @override
  ConsumerState<PasajeroDetailScreen> createState() =>
      _PasajeroDetailScreenState();
}

class _PasajeroDetailScreenState
    extends ConsumerState<PasajeroDetailScreen> {
  Pasajero? _pasajero;
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarPasajero();
  }

  Future<void> _cargarPasajero() async {
    final state = ref.read(pasajerosProvider);
        final pasajero =
        state.pasajeros.where((p) => p.id == widget.pasajeroId).firstOrNull;
    if (pasajero != null) {
      setState(() {
        _pasajero = pasajero;
        _cargando = false;
      });
    } else {
      try {
        final ds = ref.read(pasajeroDatasourceProvider);
        final p = await ds.obtenerPasajeroPorId(widget.pasajeroId);
        setState(() {
          _pasajero = p;
          _cargando = false;
        });
      } catch (e) {
        setState(() => _cargando = false);
      }
    }
  }

  Future<void> _actualizarEstado(String estado) async {
    if (_pasajero == null) return;
    await ref
        .read(pasajerosProvider.notifier)
        .actualizarEmbarque(_pasajero!.id, estado);
    setState(() {
      _pasajero = _pasajero!.copyWith(estadoEmbarque: estado);
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Estado actualizado a ${Formatters.formatEstadoEmbarque(estado)}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cargando) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalle de Pasajero')),
        body: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    final pasajero = _pasajero;
    if (pasajero == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalle de Pasajero')),
        body: const Center(
          child: Text('Pasajero no encontrado',
              style: TextStyle(color: AppColors.textSecondaryDark)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pasajero.nombreCompleto),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: pasajero.vip
                        ? AppColors.accent
                        : AppColors.primary.withValues(alpha: 0.2),
                    child: Text(
                      '${pasajero.nombre.isNotEmpty ? pasajero.nombre[0] : ''}'
                      '${pasajero.apellido.isNotEmpty ? pasajero.apellido[0] : ''}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: pasajero.vip
                            ? Colors.black
                            : AppColors.primaryLight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    pasajero.nombreCompleto,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  StatusBadge(estado: pasajero.estadoEmbarque),
                  if (pasajero.vip) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                            AppColors.accent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'PASAJERO VIP',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Información Personal',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _infoRow(Icons.person, 'Nombre',
                        pasajero.nombreCompleto),
                    const SizedBox(height: 8),
                    _infoRow(
                      Icons.confirmation_number,
                      'Documento',
                      '${Formatters.formatTipoDocumento(pasajero.tipoDocumento)}: ${pasajero.documento}',
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
                      'Información de Vuelo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _infoRow(Icons.flight, 'Vuelo',
                        pasajero.vueloCodigo),
                    const SizedBox(height: 8),
                    _infoRow(
                      Icons.airline_seat_recline_normal,
                      'Asiento',
                      pasajero.asiento,
                    ),
                    const SizedBox(height: 8),
                    _infoRow(
                      Icons.flag,
                      'Estado',
                      Formatters.formatEstadoEmbarque(
                          pasajero.estadoEmbarque),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (pasajero.estaPendiente)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _actualizarEstado('abordado'),
                  icon: const Icon(Icons.check_circle),
                  label: const Text('Marcar como Abordado'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    padding:
                        const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            if (pasajero.estaAbordado)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _actualizarEstado('pendiente'),
                  icon: const Icon(Icons.undo),
                  label:
                      const Text('Deshacer Embarque'),
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String valor) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondaryDark),
        const SizedBox(width: 12),
        SizedBox(
          width: 90,
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
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimaryDark,
            ),
          ),
        ),
      ],
    );
  }
}
