import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/admin_pasajeros_provider.dart';
import '../../widgets/admin_shell.dart';
import '../../widgets/pasajero_card.dart';
import '../../widgets/pasajero_form.dart';
import '../../widgets/search_bar.dart';
import '../../../domain/model/pasajero.dart';
import '../../../theme/app_colors.dart';

class PasajerosAdminScreen extends ConsumerStatefulWidget {
  const PasajerosAdminScreen({super.key});

  @override
  ConsumerState<PasajerosAdminScreen> createState() =>
      _PasajerosAdminScreenState();
}

class _PasajerosAdminScreenState
    extends ConsumerState<PasajerosAdminScreen> {
  final _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollCtrl.position.pixels >=
        _scrollCtrl.position.maxScrollExtent - 200) {
      ref.read(adminPasajerosProvider.notifier).cargarMas();
    }
  }

  void _mostrarFormularioCrear() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollCtrl) => Container(
          decoration: const BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textDisabledDark,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Registrar Pasajero',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
              ),
              Expanded(
                child: PasajeroForm(
                  onGuardar: (pasajero) async {
                    final exito = await ref
                        .read(adminPasajerosProvider.notifier)
                        .crearPasajero(pasajero);
                    if (exito && mounted) {
                      Navigator.pop(context);
                      _mostrarSnackBar(
                          'Pasajero registrado exitosamente');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarFormularioEditar(Pasajero pasajero) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollCtrl) => Container(
          decoration: const BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textDisabledDark,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Editar ${pasajero.nombreCompleto}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
              ),
              Expanded(
                child: PasajeroForm(
                  pasajero: pasajero,
                  onGuardar: (p) async {
                    final exito = await ref
                        .read(adminPasajerosProvider.notifier)
                        .actualizarPasajero(pasajero.id, p);
                    if (exito && mounted) {
                      Navigator.pop(context);
                      _mostrarSnackBar(
                          'Pasajero actualizado exitosamente');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmarEliminar(Pasajero pasajero) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Pasajero'),
        content: Text(
            '¿Está seguro de eliminar a ${pasajero.nombreCompleto}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final exito = await ref
                  .read(adminPasajerosProvider.notifier)
                  .eliminarPasajero(pasajero.id);
              if (exito && mounted) {
                _mostrarSnackBar('Pasajero eliminado');
              }
            },
            child: const Text(
              'Eliminar',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminPasajerosProvider);

    return AdminShell(
      child: Column(
        children: [
          SearchBarWidget(
            hintText: 'Buscar pasajeros...',
            onSearch: (q) =>
                ref.read(adminPasajerosProvider.notifier).buscar(q),
          ),
          if (state.exito != null)
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                state.exito!,
                style: const TextStyle(
                    color: AppColors.success, fontSize: 13),
              ),
            ),
          Expanded(
            child: state.cargando && state.pasajeros.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primary))
                : state.error != null && state.pasajeros.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline,
                                size: 48, color: AppColors.error),
                            const SizedBox(height: 16),
                            Text(state.error!),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => ref
                                  .read(
                                      adminPasajerosProvider.notifier)
                                  .cargarPasajeros(),
                              child: const Text('Reintentar'),
                            ),
                          ],
                        ),
                      )
                    : state.pasajeros.isEmpty
                        ? const Center(
                            child: Text(
                                'No hay pasajeros registrados'))
                        : RefreshIndicator(
                            onRefresh: () => ref
                                .read(
                                    adminPasajerosProvider.notifier)
                                .cargarPasajeros(),
                            child: ListView.builder(
                              controller: _scrollCtrl,
                              itemCount: state.pasajeros.length +
                                  (state.hayMas ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index ==
                                    state.pasajeros.length) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child:
                                          CircularProgressIndicator(),
                                    ),
                                  );
                                }
                                final pasajero =
                                    state.pasajeros[index];
                                return Stack(
                                  children: [
                                    PasajeroCard(
                                      pasajero: pasajero,
                                      onEstadoChanged: (estado) {
                                        ref
                                            .read(
                                                adminPasajerosProvider
                                                    .notifier)
                                            .actualizarEmbarque(
                                                pasajero.id,
                                                estado);
                                      },
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 4,
                                      child:
                                          PopupMenuButton<String>(
                                        itemBuilder: (context) => [
                                          const PopupMenuItem(
                                            value: 'editar',
                                            child: Row(
                                              children: [
                                                Icon(Icons.edit,
                                                    size: 18),
                                                SizedBox(width: 8),
                                                Text('Editar'),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            value: 'eliminar',
                                            child: Row(
                                              children: [
                                                Icon(Icons.delete,
                                                    size: 18,
                                                    color: AppColors
                                                        .error),
                                                SizedBox(width: 8),
                                                Text('Eliminar',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .error)),
                                              ],
                                            ),
                                          ),
                                        ],
                                        onSelected: (value) {
                                          if (value == 'editar') {
                                            _mostrarFormularioEditar(
                                                pasajero);
                                          } else {
                                            _confirmarEliminar(
                                                pasajero);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _mostrarFormularioCrear,
        icon: const Icon(Icons.person_add),
        label: const Text('Registrar Pasajero'),
      ),
    );
  }
}
