import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/admin_vuelos_provider.dart';
import '../../widgets/admin_shell.dart';
import '../../widgets/vuelo_card.dart';
import '../../widgets/vuelo_form.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/status_dropdown.dart';
import '../../../domain/model/vuelo.dart';
import '../../../theme/app_colors.dart';

class VuelosAdminScreen extends ConsumerStatefulWidget {
  const VuelosAdminScreen({super.key});

  @override
  ConsumerState<VuelosAdminScreen> createState() =>
      _VuelosAdminScreenState();
}

class _VuelosAdminScreenState
    extends ConsumerState<VuelosAdminScreen> {
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
      ref.read(adminVuelosProvider.notifier).cargarMas();
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
                  'Nuevo Vuelo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
              ),
              Expanded(
                child: VueloForm(
                  onGuardar: (vuelo) async {
                    final exito = await ref
                        .read(adminVuelosProvider.notifier)
                        .crearVuelo(vuelo);
                    if (exito && mounted) {
                      Navigator.pop(context);
                      _mostrarSnackBar('Vuelo creado exitosamente');
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

  void _mostrarFormularioEditar(Vuelo vuelo) {
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
                  'Editar Vuelo ${vuelo.codigo}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
              ),
              Expanded(
                child: VueloForm(
                  vuelo: vuelo,
                  onGuardar: (v) async {
                    final exito = await ref
                        .read(adminVuelosProvider.notifier)
                        .actualizarVuelo(vuelo.id, v);
                    if (exito && mounted) {
                      Navigator.pop(context);
                      _mostrarSnackBar(
                          'Vuelo actualizado exitosamente');
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

  void _confirmarEliminar(Vuelo vuelo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Vuelo'),
        content: Text(
            '¿Está seguro de eliminar el vuelo ${vuelo.codigo}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final exito = await ref
                  .read(adminVuelosProvider.notifier)
                  .eliminarVuelo(vuelo.id);
              if (exito && mounted) {
                _mostrarSnackBar('Vuelo eliminado');
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

  void _cambiarEstado(Vuelo vuelo) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Cambiar Estado - ${vuelo.codigo}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 16),
            StatusDropdown(
              estadoActual: vuelo.estado,
              onChanged: (estado) async {
                Navigator.pop(context);
                await ref
                    .read(adminVuelosProvider.notifier)
                    .actualizarEstado(vuelo.id, estado);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
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
    final state = ref.watch(adminVuelosProvider);

    return AdminShell(
      child: Column(
        children: [
          SearchBarWidget(
            hintText: 'Buscar vuelos...',
            onSearch: (q) =>
                ref.read(adminVuelosProvider.notifier).buscar(q),
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
            child: state.cargando && state.vuelos.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primary))
                : state.error != null && state.vuelos.isEmpty
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
                                  .read(adminVuelosProvider.notifier)
                                  .cargarVuelos(),
                              child: const Text('Reintentar'),
                            ),
                          ],
                        ),
                      )
                    : state.vuelos.isEmpty
                        ? const Center(
                            child: Text('No hay vuelos registrados'))
                        : RefreshIndicator(
                            onRefresh: () => ref
                                .read(adminVuelosProvider.notifier)
                                .cargarVuelos(),
                            child: ListView.builder(
                              controller: _scrollCtrl,
                              itemCount: state.vuelos.length +
                                  (state.hayMas ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index == state.vuelos.length) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child:
                                          CircularProgressIndicator(),
                                    ),
                                  );
                                }
                                final vuelo = state.vuelos[index];
                                return Stack(
                                  children: [
                                    VueloCard(
                                        vuelo: vuelo, esAdmin: true),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: PopupMenuButton<String>(
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
                                            value: 'estado',
                                            child: Row(
                                              children: [
                                                Icon(Icons.flag,
                                                    size: 18),
                                                SizedBox(width: 8),
                                                Text(
                                                    'Cambiar Estado'),
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
                                          switch (value) {
                                            case 'editar':
                                              _mostrarFormularioEditar(
                                                  vuelo);
                                              break;
                                            case 'estado':
                                              _cambiarEstado(vuelo);
                                              break;
                                            case 'eliminar':
                                              _confirmarEliminar(
                                                  vuelo);
                                              break;
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
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Vuelo'),
      ),
    );
  }
}
