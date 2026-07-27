import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/pasajeros_provider.dart';
import '../../widgets/pasajero_card.dart';
import '../../widgets/search_bar.dart';
import '../../../core/utils/formatters.dart';
import '../../../theme/app_colors.dart';

class PasajerosScreen extends ConsumerStatefulWidget {
  const PasajerosScreen({super.key});

  @override
  ConsumerState<PasajerosScreen> createState() => _PasajerosScreenState();
}

class _PasajerosScreenState extends ConsumerState<PasajerosScreen> {
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
      ref.read(pasajerosProvider.notifier).cargarMas();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pasajerosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pasajeros'),
      ),
      body: Column(
        children: [
          SearchBarWidget(
            hintText: 'Buscar por nombre, documento, vuelo...',
            onSearch: (q) =>
                ref.read(pasajerosProvider.notifier).buscar(q),
            onFilterTap: _mostrarFiltros,
          ),
          if (state.filtroVuelo != null || state.filtroEstado != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (state.filtroVuelo != null)
                    Chip(
                      label: Text('Vuelo: ${state.filtroVuelo}'),
                      deleteIcon:
                          const Icon(Icons.close, size: 16),
                      onDeleted: () => ref
                          .read(pasajerosProvider.notifier)
                          .filtrarPorVuelo(null),
                      backgroundColor:
                          AppColors.primary.withValues(alpha: 0.15),
                      labelStyle: const TextStyle(
                          color: AppColors.primaryLight),
                    ),
                  if (state.filtroEstado != null)
                    Chip(
                      label: Text(state.filtroEstado!),
                      deleteIcon:
                          const Icon(Icons.close, size: 16),
                      onDeleted: () => ref
                          .read(pasajerosProvider.notifier)
                          .filtrarPorEstado(null),
                      backgroundColor:
                          AppColors.accent.withValues(alpha: 0.15),
                      labelStyle:
                          const TextStyle(color: AppColors.accent),
                    ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => ref
                        .read(pasajerosProvider.notifier)
                        .limpiarFiltros(),
                    child: const Text('Limpiar'),
                  ),
                ],
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
                            Text(
                              state.error!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color:
                                      AppColors.textSecondaryDark),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => ref
                                  .read(pasajerosProvider.notifier)
                                  .cargarPasajeros(),
                              child: const Text('Reintentar'),
                            ),
                          ],
                        ),
                      )
                    : state.pasajeros.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Icon(Icons.people_outline,
                                    size: 64,
                                    color:
                                        AppColors.textDisabledDark),
                                SizedBox(height: 16),
                                Text(
                                  'No hay pasajeros registrados',
                                  style: TextStyle(
                                      color: AppColors
                                          .textSecondaryDark),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () => ref
                                .read(pasajerosProvider.notifier)
                                .cargarPasajeros(),
                            color: AppColors.primary,
                            child: ListView.builder(
                              controller: _scrollCtrl,
                              padding:
                                  const EdgeInsets.symmetric(
                                      vertical: 8),
                              itemCount: state.pasajeros.length +
                                  (state.hayMas ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index ==
                                    state.pasajeros.length) {
                                  return const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child:
                                          CircularProgressIndicator(
                                              color: AppColors
                                                  .primary),
                                    ),
                                  );
                                }
                                return PasajeroCard(
                                  pasajero: state.pasajeros[index],
                                  onTap: () => context.go(
                                      '/pasajeros/detalle/${state.pasajeros[index].id}'),
                                  onEstadoChanged: (estado) {
                                    ref
                                        .read(pasajerosProvider
                                            .notifier)
                                        .actualizarEmbarque(
                                          state
                                              .pasajeros[index].id,
                                          estado,
                                        );
                                  },
                                );
                              },
                            ),
                          ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.flight), label: 'Vuelos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Pasajeros'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Perfil'),
        ],
        onTap: (index) {
          if (index == 0) context.go('/vuelos');
          if (index == 2) context.go('/perfil');
        },
      ),
    );
  }

  void _mostrarFiltros() {
    final state = ref.read(pasajerosProvider);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Filtros de Pasajeros',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryDark,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Estado de Embarque',
              style: TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['pendiente', 'abordado', 'ausente']
                  .map((e) => ChoiceChip(
                        label: Text(Formatters.formatEstadoEmbarque(e)),
                        selected: state.filtroEstado == e,
                        onSelected: (selected) {
                          ref
                              .read(pasajerosProvider.notifier)
                              .filtrarPorEstado(
                                  selected ? e : null);
                          Navigator.pop(context);
                        },
                        selectedColor: AppColors.accent
                            .withValues(alpha: 0.3),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
