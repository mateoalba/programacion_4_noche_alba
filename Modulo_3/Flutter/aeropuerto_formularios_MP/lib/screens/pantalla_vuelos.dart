import 'package:flutter/material.dart';
import '../models/vuelo.dart';
import '../widgets/fila_vuelo.dart';
import '../widgets/tarjeta_vuelo_grid.dart';

class PantallaVuelos extends StatefulWidget {
  final List<Vuelo> vuelos;
  final void Function(int) onEliminar;
  final void Function(int)? onFavorito;

  const PantallaVuelos({
    super.key,
    required this.vuelos,
    required this.onEliminar,
    this.onFavorito,
  });

  @override
  State<PantallaVuelos> createState() => _PantallaVuelosState();
}

class _PantallaVuelosState extends State<PantallaVuelos> {
  bool _esGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.vuelos.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.flight_takeoff, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('No hay vuelos registrados',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            )
          : _esGrid
              ? GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: widget.vuelos.length,
                  itemBuilder: (ctx, i) => TarjetaVueloGrid(
                    vuelo: widget.vuelos[i],
                    onEliminar: () => widget.onEliminar(i),
                    onFavorito: widget.onFavorito != null
                        ? () => widget.onFavorito!(i)
                        : null,
                  ),
                )
              : ListView.separated(
                  itemCount: widget.vuelos.length,
                  separatorBuilder: (ctx, i) => const Divider(height: 1),
                  itemBuilder: (ctx, i) => FilaVuelo(
                    vuelo: widget.vuelos[i],
                    onEliminar: () => widget.onEliminar(i),
                    onFavorito: widget.onFavorito != null
                        ? () => widget.onFavorito!(i)
                        : null,
                  ),
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _esGrid = !_esGrid),
        icon: Icon(_esGrid ? Icons.list : Icons.grid_view),
        label: Text(_esGrid ? 'Lista' : 'Cuadrícula'),
      ),
    );
  }
}
