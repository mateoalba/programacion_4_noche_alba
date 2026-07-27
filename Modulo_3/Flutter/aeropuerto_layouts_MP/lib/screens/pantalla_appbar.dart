import 'package:flutter/material.dart';

class PantallaAppBar extends StatelessWidget {
  const PantallaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title:           const Text('Vuelos'),
            pinned:          true,
            backgroundColor: cs.primaryContainer,
            foregroundColor: cs.onPrimaryContainer,
            actions: [
              IconButton(
                icon:      const Icon(Icons.filter_list),
                onPressed: () {},
                tooltip:   'Filtrar',
              ),
              IconButton(
                icon:      const Icon(Icons.search),
                onPressed: () {},
                tooltip:   'Buscar',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: cs.primaryContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 56),
                    Icon(Icons.flight, size: 48, color: cs.onPrimaryContainer),
                    const SizedBox(height: 8),
                    Text(
                      '12 vuelos programados',
                      style: TextStyle(color: cs.onPrimaryContainer),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final destinos = [
                    'Ciudad de México', 'Bogotá', 'Lima', 'Santiago',
                    'Buenos Aires', 'Madrid', 'Miami', 'Nueva York',
                    'Tokio', 'Barcelona',
                  ];
                  final aerolineas = [
                    'Aeroméxico', 'Avianca', 'LATAM', 'Sky Airline',
                    'Copa Airlines', 'Iberia', 'American Airlines', 'Delta',
                    'Japan Airlines', 'Vueling',
                  ];
                  return Card(
                    child: ListTile(
                      leading:  Icon(Icons.flight, color: cs.primary),
                      title:    Text('AV-${1234 + i} → ${destinos[i]}'),
                      subtitle: Text('${aerolineas[i]} · ${7 + i}:00'),
                      trailing: Chip(
                        label:           Text(i < 3 ? 'Abordando' : i < 6 ? 'Programado' : 'Retrasado'),
                        backgroundColor: i < 3
                            ? Colors.green
                            : i < 6
                                ? cs.primaryContainer
                                : Colors.orange,
                        labelStyle: TextStyle(
                          color: i < 3 ? Colors.white : i < 6 ? cs.onPrimaryContainer : Colors.white,
                          fontSize: 11,
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
