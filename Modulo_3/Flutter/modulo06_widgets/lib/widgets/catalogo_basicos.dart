import 'package:flutter/material.dart';
import 'etiqueta.dart';
import 'servicio_estado.dart';
import 'contador_limitado.dart';
import 'reloj.dart';
import 'indicador.dart';
import 'tarjeta_metrica.dart';
import 'tarjeta_servidor.dart';
import '../models/servidor.dart';

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
            'nginx-proxy: Flujo de tráfico inestable',
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
            'nginx-proxy: Flujo de tráfico inestable (lineThrough)',
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
              'Problema: el tráfico se corta cada 10 minutos, sin patrón aparente. '
              'Verificar logs del balanceador y revisar configuración upstream. ' * 3,
              textAlign: TextAlign.justify,
              maxLines:  2,
              overflow:  TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: Text(
              'Problema: el tráfico se corta cada 10 minutos, sin patrón aparente. '
              'Verificar logs del balanceador y revisar configuración upstream. ' * 3,
              textAlign: TextAlign.left,
              maxLines:  2,
              overflow:  TextOverflow.clip,
              softWrap:  false,
            ),
          ),
          const SizedBox(height: 8),

          const Text.rich(
            TextSpan(children: [
              TextSpan(text: 'nginx-proxy: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              TextSpan(text: 'Inestable',
                  style: TextStyle(color: Color.fromARGB(255, 152, 54, 244), fontWeight: FontWeight.bold)),
              TextSpan(text: ' — se recomienda reiniciar el servicio.',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ]),
          ),
          const SizedBox(height: 8),

          const SelectableText(
            '10.0.0.12:5432',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          // ── Bloque 2: Icon ────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                message: 'Servidor activo',
                child: const Icon(Icons.check_circle, size: 40, color: Colors.green),
              ),
              Tooltip(
                message: 'Error crítico',
                child: const Icon(Icons.cancel, size: 40, color: Colors.red),
              ),
              Tooltip(
                message: 'Advertencia',
                child: const Icon(Icons.warning_amber, size: 40, color: Colors.orange),
              ),
              Tooltip(
                message: 'Servidor DNS',
                child: const Icon(Icons.dns, size: 40, color: Colors.indigo),
              ),
              Tooltip(
                message: 'Sin conexión',
                child: const Icon(Icons.wifi_off, size: 40, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.check_circle_outline, size: 14, color: Theme.of(context).colorScheme.primary),
              Icon(Icons.check_circle, size: 40, color: Theme.of(context).colorScheme.primary),
              const Icon(Icons.settings, size: 80, color: Colors.blueGrey),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(Icons.settings, size: 24, color: Colors.blueGrey,
              semanticLabel: 'Configuración'),
          const Divider(height: 32),

          // ── Bloque 3: Botones ─────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
              FilledButton(  onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
              TextButton(    onPressed: () {}, child: const Text('TextButton')),
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
                label: const Text('Reiniciar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.stop, size: 18),
                label: const Text('Detener'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info, size: 18),
                label: const Text('Detalles'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('Abrir'),
              ),
              IconButton(
                onPressed: () {},
                icon:     const Icon(Icons.settings),
                color:    Colors.indigo,
                iconSize: 28,
                tooltip:  'Configuración del sistema',
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
            child: const Text('Acción crítica',
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
            child: const Text('Acción crítica (plana)',
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
              leading:  const Icon(Icons.dns, color: Colors.indigo),
              title:    const Text('nginx-proxy'),
              subtitle: const Text('10.0.0.5 · 45ms'),
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
              title:    const Text('backup-worker'),
              subtitle: const Text('sin respuesta · 10.0.0.30 · se recomienda verificar el estado del servicio lo antes posible'),
              isThreeLine: true,
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Modo mantenimiento'),
              subtitle: const Text('Deshabilitar notificaciones'),
            ),
          ),
          const Divider(height: 32),

          // ── Bloque 5: Chip ────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              Chip(
                label: const Text('nginx'),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () {},
                padding: const EdgeInsets.all(8),
              ),
              const Chip(
                avatar:          Icon(Icons.check, size: 16, color: Colors.white),
                label:           Text('TLS 1.3'),
                backgroundColor: Color.fromARGB(255, 65, 233, 32),
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('HTTP/2'),
                selected: false,
                onSelected: (_) {},
              ),
              ActionChip(
                label:     const Text('Ver logs'),
                avatar:    const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
              InputChip(
                label: const Text('Producción'),
                avatar: const Icon(Icons.check, size: 16),
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
          const LinearProgressIndicator(value: 0.6, color: Colors.indigo),
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
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 12, runSpacing: 8,
            children: [
              Etiqueta(texto: 'Activo',    color: Colors.green),
              Etiqueta(texto: 'Error',     color: Colors.red,    relleno: true),
              Etiqueta(texto: 'En espera', color: Colors.orange, icono: Icons.hourglass_empty),
              Etiqueta(texto: 'Crítico',   color: Colors.red,    fontSize: 16, relleno: true, rectangular: true),
              Etiqueta(texto: 'Info',      color: Colors.blue,   fontSize: 11, icono: Icons.info),
            ],
          ),
          const Divider(height: 24),

          // ── ServicioEstado ───────────────────────────────────────
          const Text('ServicioEstado (StatefulWidget + setState)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
          const SizedBox(height: 8),
          const SizedBox(
            height: 320,
            child: ServicioEstado(nombre: 'nginx-proxy'),
          ),
          const Divider(height: 24),

          // ── ContadorLimitado ─────────────────────────────────────
          const Text('ContadorLimitado (StatefulWidget con parámetros)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 160,
                child: ContadorLimitado(
                  etiqueta: 'Intentos',
                  limite:   3,
                  color:    Colors.red,
                  textoBoton: 'Intentar',
                ),
              ),
              SizedBox(width: 160,
                child: ContadorLimitado(
                  etiqueta: 'Conexiones',
                  limite:   5,
                  color:    Colors.indigo,
                  pasoIncremento: 2,
                ),
              ),
            ],
          ),
          const Divider(height: 24),

          // ── Reloj ────────────────────────────────────────────────
          const Text('Reloj (StatefulWidget + Timer + ciclo de vida)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
          const SizedBox(height: 8),
          const SizedBox(
            height: 200,
            child: Reloj(),
          ),
          const Divider(height: 24),

          // ── Indicador ────────────────────────────────────────────
          const Text('Indicador (StatelessWidget — composición)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 32, runSpacing: 24,
            children: [
              Indicador(label: 'Servidores activos', valor: '8',
                        color: Colors.green, icono: Icons.dns),
              Indicador(label: 'Alertas críticas',   valor: '2',
                        color: Colors.red,   icono: Icons.warning_amber,
                        subtitulo: 'Requieren atención'),
              Indicador(label: 'Tráfico',            valor: '4.2 GB',
                        color: Colors.indigo, centrado: true),
              Indicador(label: 'Uptime',             valor: '99.8%',
                        color: Colors.teal, subtitulo: 'Últimos 30 días'),
            ],
          ),
          const Divider(height: 24),

          // ── TarjetaMetrica ───────────────────────────────────────
          const Text('TarjetaMetrica (Card compuesto)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
          const SizedBox(height: 8),
          const TarjetaMetrica(
            titulo: 'Activos',
            valor: '4/6',
            icono: Icons.dns,
            colorIcono: Colors.green,
          ),
          const SizedBox(height: 4),
          const TarjetaMetrica(
            titulo:    'Alertas',
            valor:     '2',
            icono:     Icons.warning_amber,
            colorIcono: Colors.orange,
            subtitulo: 'Requieren atención',
          ),
          const Divider(height: 24),

          // ── TarjetaServidor ──────────────────────────────────────
          const Text('TarjetaServidor (composición con _Barra privado)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: const [
              SizedBox(width: 180,
                child: TarjetaServidor(
                  servidor: Servidor(nombre: 'web-01', cpu: 45, ram: 62, conexiones: 230, activo: true),
                ),
              ),
              SizedBox(width: 180,
                child: TarjetaServidor(
                  servidor: Servidor(nombre: 'db-primary', cpu: 88, ram: 91, conexiones: 80, activo: true),
                ),
              ),
              SizedBox(width: 180,
                child: TarjetaServidor(
                  servidor: Servidor(nombre: 'worker-01', cpu: 0, ram: 0, conexiones: 0, activo: false),
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
