import 'dart:async';
import 'package:flutter/material.dart';
import '../models/vuelo.dart';
import '../widgets/tarjeta_metrica.dart';
import '../widgets/tarjeta_vuelo.dart';

/// Pantalla principal del dashboard de control de vuelos.
/// Refresca datos cada 3 segundos simulando un sistema en tiempo real.
class PantallaDashboard extends StatefulWidget {
  const PantallaDashboard({super.key});
  @override
  State<PantallaDashboard> createState() => _PantallaDashboardState();
}

class _PantallaDashboardState extends State<PantallaDashboard> {
  late Timer     _timer;
  List<Vuelo>    _vuelos    = [];
  bool           _cargando  = true;
  int            _ciclo     = 0;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) => _cargarDatos());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _cargarDatos() {
    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      setState(() {
        _ciclo++;
        _cargando = false;
        _vuelos = [
          Vuelo(
            id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567801',
            codigoVuelo: 'AV101',
            aerolineaCodigo: 'AV',
            aerolineaNombre: 'Avianca',
            origenCodigo: 'UIO',
            destinoCodigo: 'MAD',
            puertaCodigo: 'A12',
            estado: _ciclo % 5 == 0 ? 'retrasado' : 'abordando',
            pasajerosAbordados: 142 + (_ciclo % 30),
            capacidad: 180,
            internacional: true,
          ),
          Vuelo(
            id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567802',
            codigoVuelo: 'LA202',
            aerolineaCodigo: 'LA',
            aerolineaNombre: 'LATAM',
            origenCodigo: 'UIO',
            destinoCodigo: 'BOG',
            puertaCodigo: 'B07',
            estado: 'programado',
            pasajerosAbordados: 89 + (_ciclo % 20),
            capacidad: 160,
            internacional: false,
          ),
          Vuelo(
            id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567803',
            codigoVuelo: 'IB303',
            aerolineaCodigo: 'IB',
            aerolineaNombre: 'Iberia',
            origenCodigo: 'UIO',
            destinoCodigo: 'BCN',
            puertaCodigo: 'A05',
            estado: 'en_vuelo',
            pasajerosAbordados: 198,
            capacidad: 200,
            internacional: true,
          ),
          Vuelo(
            id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567804',
            codigoVuelo: 'EK404',
            aerolineaCodigo: 'EK',
            aerolineaNombre: 'Emirates',
            origenCodigo: 'UIO',
            destinoCodigo: 'DXB',
            puertaCodigo: 'C01',
            estado: _ciclo % 7 == 0 ? 'cancelado' : 'programado',
            pasajerosAbordados: 0,
            capacidad: 350,
            internacional: true,
          ),
          Vuelo(
            id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567805',
            codigoVuelo: 'CM505',
            aerolineaCodigo: 'CM',
            aerolineaNombre: 'Copa Airlines',
            origenCodigo: 'UIO',
            destinoCodigo: 'PTY',
            puertaCodigo: 'B03',
            estado: 'abordando',
            pasajerosAbordados: 120 + (_ciclo % 15),
            capacidad: 150,
            internacional: true,
          ),
          Vuelo(
            id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567806',
            codigoVuelo: 'VX606',
            aerolineaCodigo: 'VX',
            aerolineaNombre: 'Viva Aerobus',
            origenCodigo: 'UIO',
            destinoCodigo: 'CUN',
            puertaCodigo: 'D09',
            estado: 'programado',
            pasajerosAbordados: 55 + (_ciclo % 10),
            capacidad: 180,
            internacional: false,
          ),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final activos     = _vuelos.where((v) => v.estado != 'cancelado').length;
    final retrasos    = _vuelos.where((v) => v.estado == 'retrasado').length;
    final pasajeros   = _vuelos.fold<int>(0, (sum, v) => sum + v.pasajerosAbordados);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Vuelos'),
        actions: [
          if (_cargando)
            const Padding(
              padding: EdgeInsets.all(12),
              child: SizedBox(width: 20, height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            ),
          IconButton(icon: const Icon(Icons.refresh), onPressed: _cargarDatos),
        ],
      ),
      body: _cargando && _vuelos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(child: TarjetaMetrica(
                        titulo: 'Vuelos activos', valor: '$activos/${_vuelos.length}',
                        icono: Icons.flight, colorIcono: Colors.green,
                      )),
                      const SizedBox(width: 8),
                      Expanded(child: TarjetaMetrica(
                        titulo:    'Retrasos', valor: '$retrasos',
                        icono:     Icons.warning_amber,
                        colorIcono: retrasos > 0 ? Colors.orange : Colors.green,
                        subtitulo:  retrasos > 0 ? 'Requieren atención' : null,
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TarjetaMetrica(
                    titulo: 'Pasajeros en terminal', valor: '$pasajeros',
                    icono: Icons.people, colorIcono: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.3,
                      crossAxisSpacing: 8, mainAxisSpacing: 8,
                    ),
                    itemCount:   _vuelos.length,
                    itemBuilder: (_, i) => TarjetaVuelo(vuelo: _vuelos[i]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Ciclo #$_ciclo · actualiza cada 3 s',
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                ),
              ],
            ),
    );
  }
}
