import 'package:flutter/material.dart';
import 'etiqueta.dart';
import 'servicio_vuelo.dart';
import 'contador_pasajeros.dart';
import 'cronometro_vuelo.dart';
import 'indicador.dart';
import 'tarjeta_metrica.dart';
import 'tarjeta_vuelo.dart';
import '../models/vuelo.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ── Bloque 1: Text ────────────────────────────────────────────
          const Text(
            'Vuelo AV101: Retraso por condiciones climáticas',
            style: TextStyle(
              fontSize:      20,
              fontWeight:    FontWeight.bold,
              color:         Color.fromARGB(255, 76, 175, 175),
              letterSpacing: 0.5,
              decoration:    TextDecoration.underline,
              shadows:       [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))],
            ),
          ),
          const SizedBox(height: 8),

          const Text(
            'Vuelo AV101: Retraso por condiciones climáticas (lineThrough)',
            style: TextStyle(
              fontSize:      20,
              fontWeight:    FontWeight.bold,
              color:         Color.fromARGB(255, 76, 175, 175),
              letterSpacing: 0.5,
              decoration:    TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: Text(
              'Aviso: el vuelo AV101 presenta retraso de 45 minutos debido a condiciones climáticas adversas en el destino. '
              'Se recomienda a los pasajeros permanecer en la zona de embarque. ' * 3,
              textAlign: TextAlign.justify,
              maxLines:  2,
              overflow:  TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: Text(
              'Aviso: el vuelo AV101 presenta retraso de 45 minutos debido a condiciones climáticas adversas en el destino. '
              'Se recomienda a los pasajeros permanecer en la zona de embarque. ' * 3,
              textAlign: TextAlign.left,
              maxLines:  2,
              overflow:  TextOverflow.clip,
              softWrap:  false,
            ),
          ),
          const SizedBox(height: 8),

          const Text.rich(
            TextSpan(children: [
              TextSpan(text: 'AV101: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              TextSpan(text: 'Retrasado',
                  style: TextStyle(color: Color.fromARGB(255, 152, 54, 244), fontWeight: FontWeight.bold)),
              TextSpan(text: ' — se recomienda verificar estado en pantallas de información.',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ]),
          ),
          const SizedBox(height: 8),

          const SelectableText(
            'Puerta A12 · Terminal 1 · Sala 3',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          // ── Bloque 2: Icon ────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                message: 'Vuelo a tiempo',
                child: const Icon(Icons.check_circle, size: 40, color: Colors.green),
              ),
              Tooltip(
                message: 'Vuelo cancelado',
                child: const Icon(Icons.cancel, size: 40, color: Colors.red),
              ),
              Tooltip(
                message: 'Vuelo retrasado',
                child: const Icon(Icons.warning_amber, size: 40, color: Colors.orange),
              ),
              Tooltip(
                message: 'En vuelo',
                child: const Icon(Icons.flight, size: 40, color: Colors.blue),
              ),
              Tooltip(
                message: 'Sin señal',
                child: const Icon(Icons.wifi_off, size: 40, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.check_circle_outline, size: 14, color: Theme.of(context).colorScheme.primary),
              Icon(Icons.flight, size: 40, color: Theme.of(context).colorScheme.primary),
              const Icon(Icons.airplanemode_active, size: 80, color: Colors.blueGrey),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(Icons.airplanemode_active, size: 24, color: Colors.blueGrey,
              semanticLabel: 'Avión'),
          const Divider(height: 32),

          // ── Bloque 3: Botones ─────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Abordar vuelo')),
              FilledButton(  onPressed: () {}, child: const Text('Confirmar')),
              OutlinedButton(onPressed: () {}, child: const Text('Ver detalles')),
              TextButton(    onPressed: () {}, child: const Text('Cancelar')),
              ElevatedButton(onPressed: null,  child: const Text('Desactivado')),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.refresh, size: 18),
                label: const Text('Actualizar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.flight_takeoff, size: 18),
                label: const Text('Despegar'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info, size: 18),
                label: const Text('Información'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map, size: 18),
                label: const Text('Ruta'),
              ),
              IconButton(
                onPressed: () {},
                icon:     const Icon(Icons.notifications),
                color:    Colors.blue,
                iconSize: 28,
                tooltip:  'Notificaciones de vuelo',
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding:     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation:   12,
            ),
            child: const Text('Emergencia',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding:     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              elevation:   0,
            ),
            child: const Text('Emergencia (plana)',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 32),

          // ── Bloque 4: Card y ListTile ─────────────────────────────────
          Card(
            elevation: 12,
            margin: const EdgeInsets.only(bottom: 8),
            color: Colors.red.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              leading:  const Icon(Icons.flight, color: Colors.blue),
              title:    const Text('AV101 - Avianca'),
              subtitle: const Text('Puerta A12 · Madrid'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap:    () {},
            ),
          ),
          Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title:    const Text('EK404 - Emirates'),
              subtitle: const Text('Vuelo cancelado · Puerta C01 · Dubái · se recomienda acudir a información'),
              isThreeLine: true,
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Modo nocturno'),
              subtitle: const Text('Reducir brillo de pantallas de información'),
            ),
          ),
          const Divider(height: 32),

          // ── Bloque 5: Chip ────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              Chip(
                label: const Text('AV101'),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () {},
                padding: const EdgeInsets.all(8),
              ),
              const Chip(
                avatar:          Icon(Icons.check, size: 16, color: Colors.white),
                label:           Text('A tiempo'),
                backgroundColor: Color.fromARGB(255, 65, 233, 32),
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('Internacionales'),
                selected: false,
                onSelected: (_) {},
              ),
              ActionChip(
                label:     const Text('Ver vuelo'),
                avatar:    const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
              InputChip(
                label: const Text('En vuelo'),
                avatar: const Icon(Icons.flight, size: 16),
                selected: true,
                onSelected: (_) {},
                onDeleted: () {},
              ),
            ],
          ),
          const Divider(height: 32),

          // ── Bloque 6: Indicadores de progreso ────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 48, height: 48,
                  child: CircularProgressIndicator()),
              SizedBox(
                width: 48, height: 48,
                child: Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(
                    value: 0.7, color: Colors.green, strokeWidth: 6),
                ),
              ),
              const SizedBox(width: 48, height: 48,
                  child: CircularProgressIndicator(
                    value: 0.3, color: Colors.red,
                    strokeWidth: 3, strokeCap: StrokeCap.round,
                    backgroundColor: Color.fromARGB(50, 200, 200, 200),
                  )),
            ],
          ),
          const SizedBox(height: 16),
          const LinearProgressIndicator(),
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: 0.6, color: Colors.blue),
          const SizedBox(height: 8),
          const LinearProgressIndicator(
              value: 1.0, color: Colors.green, minHeight: 12),

          const Divider(height: 32),

          // ──────────── Widgets del proyecto ────────────
          const Text('Widgets del proyecto',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // ── Etiqueta ─────────────────────────────────────────────
          const Text('Etiqueta (StatelessWidget con parámetros)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 12, runSpacing: 8,
            children: [
              Etiqueta(texto: 'Programado', color: Colors.blue),
              Etiqueta(texto: 'Abordando',  color: Colors.green, relleno: true),
              Etiqueta(texto: 'En vuelo',   color: Colors.teal, icono: Icons.flight),
              Etiqueta(texto: 'Retrasado',  color: Colors.orange, fontSize: 16, relleno: true, rectangular: true),
              Etiqueta(texto: 'Cancelado',  color: Colors.red,   fontSize: 11, icono: Icons.cancel),
            ],
          ),
          const Divider(height: 24),

          // ── ServicioVuelo ───────────────────────────────────────
          const Text('ServicioVuelo (StatefulWidget + setState)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
          const SizedBox(height: 8),
          const SizedBox(
            height: 320,
            child: ServicioVuelo(ruta: 'Ruta Madrid - Quito'),
          ),
          const Divider(height: 24),

          // ── ContadorPasajeros ───────────────────────────────────
          const Text('ContadorPasajeros (StatefulWidget con parámetros)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 160,
                child: ContadorPasajeros(
                  etiqueta: 'Embarque A',
                  limite:   180,
                  color:    Colors.blue,
                  textoBoton: 'Abordar',
                ),
              ),
              SizedBox(width: 160,
                child: ContadorPasajeros(
                  etiqueta: 'Embarque B',
                  limite:   120,
                  color:    Colors.teal,
                  pasoIncremento: 2,
                ),
              ),
            ],
          ),
          const Divider(height: 24),

          // ── CronometroVuelo ─────────────────────────────────────
          const Text('CronometroVuelo (StatefulWidget + Timer + ciclo de vida)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
          const SizedBox(height: 8),
          const SizedBox(
            height: 200,
            child: CronometroVuelo(),
          ),
          const Divider(height: 24),

          // ── Indicador ────────────────────────────────────────────
          const Text('Indicador (StatelessWidget — composición)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 32, runSpacing: 24,
            children: [
              Indicador(label: 'Vuelos activos',  valor: '5',
                        color: Colors.green, icono: Icons.flight),
              Indicador(label: 'Retrasos',        valor: '1',
                        color: Colors.orange,   icono: Icons.warning_amber,
                        subtitulo: 'Requieren atención'),
              Indicador(label: 'Pasajeros',       valor: '1.2K',
                        color: Colors.blue, centrado: true),
              Indicador(label: 'Puntualidad',     valor: '94.2%',
                        color: Colors.teal, subtitulo: 'Últimos 30 días'),
            ],
          ),
          const Divider(height: 24),

          // ── TarjetaMetrica ───────────────────────────────────────
          const Text('TarjetaMetrica (Card compuesto)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
          const SizedBox(height: 8),
          const TarjetaMetrica(
            titulo: 'Vuelos activos',
            valor: '5/6',
            icono: Icons.flight,
            colorIcono: Colors.green,
          ),
          const SizedBox(height: 4),
          const TarjetaMetrica(
            titulo:    'Retrasos',
            valor:     '1',
            icono:     Icons.warning_amber,
            colorIcono: Colors.orange,
            subtitulo: 'Requieren atención',
          ),
          const Divider(height: 24),

          // ── TarjetaVuelo ────────────────────────────────────────
          const Text('TarjetaVuelo (composición con _Barra privado)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: const [
              SizedBox(width: 180,
                child: TarjetaVuelo(
                  vuelo: Vuelo(id: 'f1a1b1c1-d1e1-f1a1-b1c1-d1e1f1a1b1c1', codigoVuelo: 'AV101', aerolineaCodigo: 'AV', aerolineaNombre: 'Avianca', origenCodigo: 'UIO', destinoCodigo: 'MAD', puertaCodigo: 'A12', estado: 'abordando', pasajerosAbordados: 142, capacidad: 180, internacional: true),
                ),
              ),
              SizedBox(width: 180,
                child: TarjetaVuelo(
                  vuelo: Vuelo(id: 'f2a2b2c2-d2e2-f2a2-b2c2-d2e2f2a2b2c2', codigoVuelo: 'IB303', aerolineaCodigo: 'IB', aerolineaNombre: 'Iberia', origenCodigo: 'UIO', destinoCodigo: 'BCN', puertaCodigo: 'A05', estado: 'en_vuelo', pasajerosAbordados: 198, capacidad: 200, internacional: true),
                ),
              ),
              SizedBox(width: 180,
                child: TarjetaVuelo(
                  vuelo: Vuelo(id: 'f3a3b3c3-d3e3-f3a3-b3c3-d3e3f3a3b3c3', codigoVuelo: 'EK404', aerolineaCodigo: 'EK', aerolineaNombre: 'Emirates', origenCodigo: 'UIO', destinoCodigo: 'DXB', puertaCodigo: 'C01', estado: 'cancelado', pasajerosAbordados: 0, capacidad: 350, internacional: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
