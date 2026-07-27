import 'package:flutter/material.dart';
import '../models/vuelo.dart';

class PantallaBusqueda extends StatefulWidget {
  final List<Vuelo> vuelos;

  const PantallaBusqueda({super.key, required this.vuelos});

  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  String _consulta = '';

  List<Vuelo> get _filtrados {
    if (_consulta.isEmpty) return widget.vuelos;
    final q = _consulta.toLowerCase();
    return widget.vuelos.where((v) {
      return v.codigoVuelo.toLowerCase().contains(q) ||
          v.aerolineaCodigo.toLowerCase().contains(q) ||
          v.aerolineaNombre.toLowerCase().contains(q) ||
          v.origenCodigo.toLowerCase().contains(q) ||
          v.destinoCodigo.toLowerCase().contains(q);
    }).toList();
  }

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
    final resultados = _filtrados;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Buscar vuelo',
              hintText: 'Código, aerolínea, origen o destino...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.flight),
            ),
            onChanged: (v) => setState(() => _consulta = v),
          ),
        ),
        if (_consulta.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${resultados.length} resultado(s) para "$_consulta"',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        const SizedBox(height: 8),
        Expanded(
          child: resultados.isEmpty
              ? const Center(
                  child: Text('No se encontraron vuelos',
                      style: TextStyle(color: Colors.grey)),
                )
              : ListView.separated(
                  itemCount: resultados.length,
                  separatorBuilder: (ctx, i) => const Divider(height: 1),
                  itemBuilder: (ctx, i) {
                    final v = resultados[i];
                    final color = _colorEstado(v.estado);
                    final nombreAerolinea =
                        v.aerolineaNombre.isNotEmpty
                            ? v.aerolineaNombre
                            : v.aerolineaCodigo;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: color.withAlpha(40),
                        child: Icon(Icons.flight, color: color, size: 20),
                      ),
                      title: Text('${v.codigoVuelo} - $nombreAerolinea'),
                      subtitle: Text(
                          'Origen: ${v.origenCodigo} → Destino: ${v.destinoCodigo} | Puerta: ${v.puertaCodigo}'),
                      trailing: Chip(
                        label: Text(v.estado,
                            style: const TextStyle(fontSize: 11)),
                        backgroundColor: color.withAlpha(30),
                        labelStyle: TextStyle(color: color),
                        visualDensity: VisualDensity.compact,
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
