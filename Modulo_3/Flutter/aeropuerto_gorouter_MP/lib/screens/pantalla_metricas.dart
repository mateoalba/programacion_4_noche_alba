import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vuelo.dart';
import '../services/vuelos_service.dart';

class PantallaMetricas extends ConsumerStatefulWidget {
  const PantallaMetricas({super.key});

  @override
  ConsumerState<PantallaMetricas> createState() => _PantallaMetricasState();
}

class _PantallaMetricasState extends ConsumerState<PantallaMetricas> {
  final VuelosService _vuelosService = VuelosService();
  List<Vuelo> _vuelos = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    try {
      final result = await _vuelosService.getVuelos();
      setState(() {
        _vuelos = result['results'] as List<Vuelo>;
        _cargando = false;
      });
    } catch (_) {
      setState(() => _cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    if (_cargando) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final total = _vuelos.length;
    final programados =
        _vuelos.where((v) => v.estado == 'programado').length;
    final enVuelo = _vuelos.where((v) => v.estado == 'en_vuelo').length;
    final retrasados = _vuelos.where((v) => v.estado == 'retrasado').length;
    final cancelados = _vuelos.where((v) => v.estado == 'cancelado').length;
    final abordando = _vuelos.where((v) => v.estado == 'abordando').length;
    final aterrizados = _vuelos.where((v) => v.estado == 'aterrizado').length;
    final internacionales =
        _vuelos.where((v) => v.internacional).length;
    final totalPasajeros =
        _vuelos.fold<int>(0, (sum, v) => sum + v.pasajerosAbordados);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Metricas de Vuelos'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: RefreshIndicator(
        onRefresh: _cargar,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MetricCard('Total vuelos', '$total', Icons.flight, Colors.blue),
              _MetricCard(
                  'Total pasajeros', '$totalPasajeros', Icons.people, Colors.purple),
              const SizedBox(height: 16),
              const Text('Por estado',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _MetricCard('Programados', '$programados', Icons.schedule,
                  Colors.blue),
              _MetricCard(
                  'En vuelo', '$enVuelo', Icons.flight, Colors.green),
              _MetricCard('Abordando', '$abordando', Icons.person_add,
                  Colors.orange),
              _MetricCard(
                  'Retrasados', '$retrasados', Icons.warning, Colors.red),
              _MetricCard(
                  'Cancelados', '$cancelados', Icons.cancel, Colors.grey),
              _MetricCard('Aterrizados', '$aterrizados', Icons.flight_land,
                  Colors.teal),
              const SizedBox(height: 16),
              _MetricCard('Internacionales', '$internacionales', Icons.public,
                  Colors.indigo),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _MetricCard(this.label, this.value, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(label),
        trailing: Text(value,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }
}
