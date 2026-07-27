import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/vuelos_provider.dart';
import '../../widgets/status_badge.dart';
import '../../../domain/model/vuelo.dart';
import '../../../core/utils/formatters.dart';
import '../../../theme/app_colors.dart';

class VuelosHomeScreen extends ConsumerStatefulWidget {
  const VuelosHomeScreen({super.key});

  @override
  ConsumerState<VuelosHomeScreen> createState() => _VuelosHomeScreenState();
}

class _VuelosHomeScreenState extends ConsumerState<VuelosHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(vuelosProvider);

    final despegues = state.vuelos
        .where((v) =>
            v.estaProgramado ||
            v.estado == 'embarque' ||
            v.estado == 'abordando')
        .toList()
      ..sort((a, b) => a.fechaSalida.compareTo(b.fechaSalida));

    final enVuelo =
        state.vuelos.where((v) => v.estaEnVuelo).toList();

    final recientes = state.vuelos
        .where((v) => v.estaAterrizado)
        .toList()
      ..sort((a, b) =>
          (b.fechaLlegada ?? b.fechaSalida)
              .compareTo(a.fechaLlegada ?? a.fechaSalida));

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.success
                        .withValues(alpha: _pulseAnimation.value),
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            const Text('Torre de Control'),
          ],
        ),
      ),
      body: state.cargando && state.vuelos.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator(color: AppColors.primary))
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(vuelosProvider.notifier).cargarVuelos(),
              color: AppColors.primary,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _resumenStats(state.vuelos),
                  const SizedBox(height: 24),
                  _seccion(
                    'Salidas Próximas',
                    Icons.flight_takeoff,
                    AppColors.primary,
                    despegues,
                    state.vuelos.isEmpty,
                  ),
                  const SizedBox(height: 24),
                  _seccion(
                    'En Vuelo',
                    Icons.flight,
                    AppColors.accent,
                    enVuelo,
                    false,
                  ),
                  const SizedBox(height: 24),
                  _seccion(
                    'Recientes',
                    Icons.history,
                    AppColors.textSecondaryDark,
                    recientes.take(5).toList(),
                    false,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.flight), label: 'Vuelos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Pasajeros'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Perfil'),
        ],
        onTap: (index) {
          if (index == 1) context.go('/pasajeros');
          if (index == 2) context.go('/perfil');
        },
      ),
    );
  }

  Widget _resumenStats(List<Vuelo> vuelos) {
    final programados =
        vuelos.where((v) => v.estaProgramado).length;
    final enVuelo = vuelos.where((v) => v.estaEnVuelo).length;
    final retrasados =
        vuelos.where((v) => v.estado == 'retrasado').length;
    final aterrizados =
        vuelos.where((v) => v.estaAterrizado).length;

    return Row(
      children: [
        _statMini('Prog.', programados, AppColors.info),
        const SizedBox(width: 8),
        _statMini('Vuelo', enVuelo, AppColors.accent),
        const SizedBox(width: 8),
        _statMini('Retras', retrasados, AppColors.warning),
        const SizedBox(width: 8),
        _statMini('Aterr.', aterrizados, AppColors.success),
      ],
    );
  }

  Widget _statMini(String label, int valor, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Text(
              valor.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _seccion(String titulo, IconData icon, Color color,
      List<Vuelo> vuelos, bool vacio) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const Spacer(),
            Text(
              '${vuelos.length}',
              style: TextStyle(
                fontSize: 14,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (vuelos.isEmpty && !vacio)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'No hay vuelos en esta categoría',
                style:
                    TextStyle(color: AppColors.textSecondaryDark),
              ),
            ),
          )
        else
          ...vuelos.map((v) => _vueloRow(v)),
      ],
    );
  }

  Widget _vueloRow(Vuelo vuelo) {
    final ahora = DateTime.now();
    final diff = vuelo.fechaSalida.difference(ahora);
    String tiempoStr;
    if (diff.isNegative) {
      tiempoStr = 'Salido';
    } else if (diff.inHours > 0) {
      tiempoStr = '${diff.inHours}h ${diff.inMinutes % 60}m';
    } else {
      tiempoStr = '${diff.inMinutes}m';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            color: Formatters.estadoVueloColor(vuelo.estado),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        title: Row(
          children: [
            Text(
              vuelo.codigo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 1,
                color: AppColors.primaryLight,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                vuelo.aerolineaNombre.isNotEmpty
                    ? vuelo.aerolineaNombre
                    : vuelo.aerolinea,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondaryDark,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              '${vuelo.origenCodigo.isNotEmpty ? vuelo.origenCodigo : vuelo.origen} → ${vuelo.destinoCodigo.isNotEmpty ? vuelo.destinoCodigo : vuelo.destino}',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimaryDark,
              ),
            ),
            const Spacer(),
            Text(
              Formatters.formatHora(vuelo.fechaSalida),
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondaryDark,
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            StatusBadge(estado: vuelo.estado, pequeno: true),
            if (vuelo.estaProgramado || vuelo.estado == 'embarque')
              Text(
                tiempoStr,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textDisabledDark,
                ),
              ),
          ],
        ),
        onTap: () => context.go('/vuelos/detalle/${vuelo.id}'),
      ),
    );
  }
}
