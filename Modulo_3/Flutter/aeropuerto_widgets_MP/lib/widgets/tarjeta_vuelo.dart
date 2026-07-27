import 'package:flutter/material.dart';
import '../models/vuelo.dart';

/// Widget que muestra la información de un vuelo en una tarjeta.
/// Incluye indicador de estado, código, aerolínea, destino, puerta
/// y barra de progreso de ocupación.
class TarjetaVuelo extends StatelessWidget {
  final Vuelo vuelo;
  const TarjetaVuelo({super.key, required this.vuelo});

  @override
  Widget build(BuildContext context) {
    final color = switch (vuelo.estado) {
      'programado'  => Colors.blue,
      'abordando'   => Colors.green,
      'en_vuelo'    => Colors.teal,
      'aterrizado'  => Colors.teal,
      'retrasado'   => Colors.orange,
      'cancelado'   => Colors.red,
      _             => Colors.grey,
    };

    final ocupacion = vuelo.capacidad > 0
        ? (vuelo.pasajerosAbordados / vuelo.capacidad).clamp(0.0, 1.0)
        : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(vuelo.enVuelo ? Icons.flight : Icons.circle,
                    color: color, size: vuelo.enVuelo ? 16 : 12),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(vuelo.codigoVuelo,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis),
                ),
                if (vuelo.esCritico)
                  const Icon(Icons.warning_amber, color: Colors.orange, size: 16),
              ],
            ),
            const SizedBox(height: 4),
            Text('${vuelo.aerolineaCodigo} · ${vuelo.aerolineaNombre}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            Text('${vuelo.origenCodigo} → ${vuelo.destinoCodigo} · Puerta ${vuelo.puertaCodigo}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value:           ocupacion,
                    backgroundColor: Colors.grey.shade200,
                    color:           color,
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 56,
                  child: Text('${vuelo.pasajerosAbordados}/${vuelo.capacidad}',
                      style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.right),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(vuelo.estado,
                style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
