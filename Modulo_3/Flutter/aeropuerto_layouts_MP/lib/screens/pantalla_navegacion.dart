import 'package:flutter/material.dart';

class PantallaNavegacion extends StatefulWidget {
  const PantallaNavegacion({super.key});

  @override
  State<PantallaNavegacion> createState() => _PantallaNavegacionState();
}

class _PantallaNavegacionState extends State<PantallaNavegacion> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Control de Vuelos'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaDashboard(),
          _PantallaVuelos(),
          _PantallaAlertas(),
          _PantallaAjustes(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.primaryContainer,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label:        'Dashboard',
          ),
          NavigationDestination(
            icon:         Icon(Icons.flight_outlined),
            selectedIcon: Icon(Icons.flight),
            label:        'Vuelos',
          ),
          NavigationDestination(
            icon:         Badge(label: Text('3'), child: Icon(Icons.notifications_outlined)),
            selectedIcon: Badge(label: Text('3'), child: Icon(Icons.notifications)),
            label:        'Alertas',
          ),
          NavigationDestination(
            icon:         Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label:        'Ajustes',
          ),
        ],
      ),
    );
  }
}

class _PantallaDashboard extends StatelessWidget {
  const _PantallaDashboard();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen', style: text.headlineSmall),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Vuelos', valor: '12', icono: Icons.flight, color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Retrasos', valor: '3', icono: Icons.schedule, color: cs.errorContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Abordando', valor: '5', icono: Icons.people, color: cs.tertiaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'En vuelo',  valor: '8', icono: Icons.flight, color: cs.secondaryContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Terminales', valor: '3', icono: Icons.business, color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Puertas',   valor: '24', icono: Icons.door_sliding, color: cs.tertiaryContainer)),
        ]),
      ],
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color    color;

  const _TarjetaMetrica({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor,  style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaVuelos extends StatelessWidget {
  const _PantallaVuelos();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final vuelos = [
      (codigo: 'AV1234', aerolineaCodigo: 'AV', aerolineaNombre: 'Avianca',    origenCodigo: 'UIO', destinoCodigo: 'MEX', puertaCodigo: 'A12', estado: 'abordando',   capacidad: 180, pasajerosAbordados: 156, internacional: true),
      (codigo: 'LA5678', aerolineaCodigo: 'LA', aerolineaNombre: 'LATAM',      origenCodigo: 'UIO', destinoCodigo: 'BOG', puertaCodigo: 'B07', estado: 'programado',  capacidad: 160, pasajerosAbordados: 89,  internacional: false),
      (codigo: 'CM9012', aerolineaCodigo: 'CM', aerolineaNombre: 'Copa Airlines', origenCodigo: 'UIO', destinoCodigo: 'MIA', puertaCodigo: 'C03', estado: 'retrasado',   capacidad: 150, pasajerosAbordados: 120, internacional: true),
      (codigo: 'IB3456', aerolineaCodigo: 'IB', aerolineaNombre: 'Iberia',     origenCodigo: 'UIO', destinoCodigo: 'MAD', puertaCodigo: 'A05', estado: 'programado',  capacidad: 200, pasajerosAbordados: 0,   internacional: true),
      (codigo: 'AA7890', aerolineaCodigo: 'AA', aerolineaNombre: 'American',   origenCodigo: 'UIO', destinoCodigo: 'JFK', puertaCodigo: 'D15', estado: 'abordando',   capacidad: 220, pasajerosAbordados: 198, internacional: true),
      (codigo: 'DL1122', aerolineaCodigo: 'DL', aerolineaNombre: 'Delta',      origenCodigo: 'UIO', destinoCodigo: 'ATL', puertaCodigo: 'B03', estado: 'programado',  capacidad: 190, pasajerosAbordados: 0,   internacional: true),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: vuelos.length,
      itemBuilder: (ctx, i) {
        final v = vuelos[i];
        final esRetrasado = v.estado == 'retrasado';
        return Card(
          child: ListTile(
            leading:  Icon(Icons.flight, color: cs.primary),
            title:    Text('${v.codigo} → ${v.destinoCodigo}'),
            subtitle: Text('${v.aerolineaCodigo} · ${v.aerolineaNombre} · ${v.puertaCodigo}'),
            trailing: Icon(
              esRetrasado ? Icons.warning : Icons.chevron_right,
              color: esRetrasado ? Colors.orange : cs.onSurfaceVariant,
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}

class _PantallaAlertas extends StatelessWidget {
  const _PantallaAlertas();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const alertas = [
      (vuelo: 'CM9012',   mensaje: 'Retraso por clima — 45 min',          nivel: 'CRÍTICO'),
      (vuelo: 'AV1234',   mensaje: 'Puerta A12 cambió a B07',             nivel: 'AVISO'),
      (vuelo: 'IB3456',   mensaje: 'Documentación pendiente del piloto',  nivel: 'CRÍTICO'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: alertas.length,
      itemBuilder: (ctx, i) {
        final alerta = alertas[i];
        final esCritico = alerta.nivel == 'CRÍTICO';

        return Card(
          color: esCritico ? cs.errorContainer : cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(
              esCritico ? Icons.error : Icons.warning,
              color: esCritico ? cs.onErrorContainer : cs.onTertiaryContainer,
            ),
            title: Text(alerta.vuelo,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(alerta.mensaje),
            trailing: Chip(
              label: Text(alerta.nivel, style: const TextStyle(fontSize: 11)),
              backgroundColor: esCritico ? cs.error : cs.tertiary,
              labelStyle: TextStyle(
                color: esCritico ? cs.onError : cs.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PantallaAjustes extends StatelessWidget {
  const _PantallaAjustes();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title:   Text('Notificaciones de vuelos'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.security_outlined),
          title:   Text('Seguridad del aeropuerto'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title:   Text('Acerca de'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
