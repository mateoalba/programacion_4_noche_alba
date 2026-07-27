import 'package:flutter/material.dart';
import 'widgets/catalogo_basicos.dart';
import 'widgets/etiqueta.dart';
import 'widgets/servicio_vuelo.dart';
import 'widgets/contador_pasajeros.dart';
import 'widgets/cronometro_vuelo.dart';
import 'screens/pantalla_contexto.dart';
import 'screens/pantalla_dashboard.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo                        │
// │  3  Paso 2   StatelessWidget con parámetros (etiquetas vuelo)  │
// │  4  Paso 3   StatefulWidget / setState / servicio de ruta       │
// │  5  Paso 3b  Parámetros en StatefulWidget (contador pasajeros)  │
// │  6  Paso 4   Ciclo de vida con Timer (cronómetro de vuelo)     │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Dashboard de control de vuelos                     │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 4; // Cambia este número para navegar entre pasos

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Bienvenida())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
          body: Center(
            child: Wrap(
              spacing: 12, runSpacing: 8,
              children: [
                Etiqueta(texto: 'Programado', color: Colors.blue),
                Etiqueta(texto: 'Abordando',  color: Colors.green, relleno: true),
                Etiqueta(texto: 'En vuelo',   color: Colors.teal),
                Etiqueta(texto: 'Retrasado',  color: Colors.orange, fontSize: 16, relleno: true),
                Etiqueta(texto: 'Cancelado',  color: Colors.red,   fontSize: 11),
              ],
            ),
          ),
        ),
    4 => const Scaffold(
          body: Center(child: ServicioVuelo(ruta: 'Ruta Madrid - Quito')),
        ),
    5 => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ContadorPasajeros(
                  etiqueta: 'Pasajeros embarque A',
                  limite:   180,
                  color:    Colors.blue,
                ),
                SizedBox(height: 40),
                ContadorPasajeros(
                  etiqueta: 'Pasajeros embarque B',
                  limite:   120,
                  color:    Colors.teal,
                ),
              ],
            ),
          ),
        ),
    6 => Scaffold(
          appBar: AppBar(title: const Text('Cronómetro de vuelo')),
          body: const Center(child: CronometroVuelo()),
        ),
    7 => const PantallaContexto(),
    8 => const PantallaDashboard(),
    _ => Scaffold(body: Center(child: Text('Paso $paso no definido'))),
  },
));

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});
  @override
  Widget build(BuildContext context) =>
      const Text('Bienvenido al Aeropuerto', style: TextStyle(fontSize: 32));
}
