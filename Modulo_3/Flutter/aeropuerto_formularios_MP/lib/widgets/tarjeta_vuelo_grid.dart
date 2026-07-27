import 'package:flutter/material.dart';
import '../models/vuelo.dart';

class TarjetaVueloGrid extends StatelessWidget {
  final Vuelo vuelo;
  final VoidCallback onEliminar;
  final VoidCallback? onFavorito;
  final VoidCallback? onEditar;

  const TarjetaVueloGrid({
    super.key,
    required this.vuelo,
    required this.onEliminar,
    this.onFavorito,
    this.onEditar,
  });

  Color _colorEstado(String estado) {
    switch (estado) {
      case 'programado':
        return Colors.blue;
      case 'abordando':
        return Colors.orange;
      case 'en_vuelo':
        return Colors.green;
      case 'retrasado':
        return Colors.red;
      case 'cancelado':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorEstado(vuelo.estado);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    vuelo.codigoVuelo,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    if (onFavorito != null)
                      GestureDetector(
                        onTap: onFavorito,
                        child: Icon(
                          vuelo.favorito ? Icons.star : Icons.star_border,
                          color: vuelo.favorito ? Colors.amber : Colors.grey,
                          size: 20,
                        ),
                      ),
                    const SizedBox(width: 4),
                    if (onEditar != null)
                      GestureDetector(
                        onTap: onEditar,
                        child: const Icon(Icons.edit_outlined,
                            color: Colors.blue, size: 20),
                      ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Eliminar vuelo'),
                            content: Text(
                                '¿Desea eliminar el vuelo ${vuelo.codigoVuelo}?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                  onEliminar();
                                },
                                child: const Text('Eliminar',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Icon(Icons.delete_outline,
                          color: Colors.red, size: 20),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
                vuelo.aerolineaNombre.isNotEmpty
                    ? vuelo.aerolineaNombre
                    : vuelo.aerolineaCodigo,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.flight_takeoff,
                    size: 16, color: Colors.blueGrey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text('Origen: ${vuelo.origenCodigo}',
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.flight_land,
                    size: 16, color: Colors.blueGrey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text('Destino: ${vuelo.destinoCodigo}',
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.door_front_door,
                    size: 16, color: Colors.blueGrey),
                const SizedBox(width: 4),
                Text('Puerta: ${vuelo.puertaCodigo}',
                    style: const TextStyle(fontSize: 13)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.people, size: 16, color: Colors.blueGrey),
                const SizedBox(width: 4),
                Text('${vuelo.pasajerosAbordados}/${vuelo.capacidad}',
                    style: const TextStyle(fontSize: 13)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.public, size: 16, color: Colors.blueGrey),
                const SizedBox(width: 4),
                Text(
                    vuelo.internacional ? 'Internacional' : 'Nacional',
                    style: const TextStyle(fontSize: 13)),
              ],
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerRight,
              child: Chip(
                label: Text(vuelo.estado,
                    style:
                        const TextStyle(fontSize: 11, color: Colors.white)),
                backgroundColor: color,
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
