import 'package:flutter/material.dart';
import '../models/vuelo.dart';

class FilaVuelo extends StatelessWidget {
  final Vuelo vuelo;
  final VoidCallback onEliminar;
  final VoidCallback? onFavorito;
  final VoidCallback? onEditar;

  const FilaVuelo({
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

  IconData _iconoEstado(String estado) {
    switch (estado) {
      case 'programado':
        return Icons.schedule;
      case 'abordando':
        return Icons.person_add;
      case 'en_vuelo':
        return Icons.flight;
      case 'retrasado':
        return Icons.access_time;
      case 'cancelado':
        return Icons.cancel;
      default:
        return Icons.flight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorEstado(vuelo.estado);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withAlpha(40),
        child: Icon(_iconoEstado(vuelo.estado), color: color, size: 22),
      ),
      title: Text(
        '${vuelo.codigoVuelo} - ${vuelo.aerolineaNombre.isNotEmpty ? vuelo.aerolineaNombre : vuelo.aerolineaCodigo}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
          'Origen: ${vuelo.origenCodigo} → Destino: ${vuelo.destinoCodigo} | Puerta: ${vuelo.puertaCodigo}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chip(
            label: Text(vuelo.estado, style: const TextStyle(fontSize: 11)),
            backgroundColor: color.withAlpha(30),
            labelStyle: TextStyle(color: color),
            visualDensity: VisualDensity.compact,
          ),
          if (onEditar != null)
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: Colors.blue),
              onPressed: onEditar,
              tooltip: 'Editar',
            ),
          if (onFavorito != null)
            IconButton(
              icon: Icon(
                vuelo.favorito ? Icons.star : Icons.star_border,
                color: vuelo.favorito ? Colors.amber : Colors.grey,
              ),
              onPressed: onFavorito,
              tooltip: 'Favorito',
            ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
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
            tooltip: 'Eliminar',
          ),
        ],
      ),
    );
  }
}
