import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/vuelos_provider.dart';
import '../../widgets/vuelo_card.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/filters_sheet.dart';
import '../../../theme/app_colors.dart';

class VuelosScreen extends ConsumerStatefulWidget {
  const VuelosScreen({super.key});

  @override
  ConsumerState<VuelosScreen> createState() => _VuelosScreenState();
}

class _VuelosScreenState extends ConsumerState<VuelosScreen> {
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
      ref.read(vuelosProvider.notifier).cargarMas();
    }
  }

  void _mostrarFiltros() {
    final state = ref.read(vuelosProvider);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FiltersSheet(
        estadoActual: state.filtroEstado,
        aerolineaActual: state.filtroAerolinea,
        onAplicar: (estado, aerolinea) {
          ref.read(vuelosProvider.notifier).filtrarPorEstado(estado);
          ref.read(vuelosProvider.notifier).filtrarPorAerolinea(aerolinea);
        },
        onLimpiar: () {
          ref.read(vuelosProvider.notifier).limpiarFiltros();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(vuelosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vuelos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(
            hintText: 'Buscar vuelo, aerolínea, destino...',
            onSearch: (q) =>
                ref.read(vuelosProvider.notifier).buscar(q),
            onFilterTap: _mostrarFiltros,
          ),
          if (state.filtroEstado != null ||
              state.filtroAerolinea != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (state.filtroEstado != null)
                    Chip(
                      label: Text(state.filtroEstado!),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () =>
                          ref.read(vuelosProvider.notifier).filtrarPorEstado(null),
                      backgroundColor:
                          AppColors.primary.withValues(alpha: 0.15),
                      labelStyle:
                          const TextStyle(color: AppColors.primaryLight),
                    ),
                  if (state.filtroEstado != null &&
                      state.filtroAerolinea != null)
                    const SizedBox(width: 8),
                  if (state.filtroAerolinea != null)
                    Chip(
                      label: Text(state.filtroAerolinea!),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () => ref
                          .read(vuelosProvider.notifier)
                          .filtrarPorAerolinea(null),
                      backgroundColor:
                          AppColors.accent.withValues(alpha: 0.15),
                      labelStyle:
                          const TextStyle(color: AppColors.accent),
                    ),
                  const Spacer(),
                  TextButton(
                    onPressed: () =>
                        ref.read(vuelosProvider.notifier).limpiarFiltros(),
                    child: const Text('Limpiar'),
                  ),
                ],
              ),
            ),
          ],
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
                            Text(
                              state.error!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColors.textSecondaryDark),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => ref
                                  .read(vuelosProvider.notifier)
                                  .cargarVuelos(),
                              child: const Text('Reintentar'),
                            ),
                          ],
                        ),
                      )
                    : state.vuelos.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.flight_takeoff,
                                    size: 64,
                                    color: AppColors.textDisabledDark),
                                SizedBox(height: 16),
                                Text(
                                  'No hay vuelos disponibles',
                                  style: TextStyle(
                                      color:
                                          AppColors.textSecondaryDark),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () => ref
                                .read(vuelosProvider.notifier)
                                .cargarVuelos(),
                            color: AppColors.primary,
                            child: ListView.builder(
                              controller: _scrollCtrl,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                              itemCount: state.vuelos.length +
                                  (state.hayMas ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index == state.vuelos.length) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                          color: AppColors.primary),
                                    ),
                                  );
                                }
                                return VueloCard(
                                    vuelo: state.vuelos[index]);
                              },
                            ),
                          ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'Vuelos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Pasajeros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          if (index == 1) context.go('/pasajeros');
          if (index == 2) context.go('/perfil');
        },
      ),
    );
  }
}
