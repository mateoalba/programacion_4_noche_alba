// lib/main.dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Scaffold(body: SafeArea(child: SaludoDemos())),
));

class SaludoDemos extends StatelessWidget {
  const SaludoDemos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 1. fontWeight + letterSpacing
        _Seccion(
          titulo: '1. fontWeight: bold + letterSpacing: 4',
          child: const Text(
            'Hola Flutter',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
        ),

        // 2. color: indigo, teal, deepOrange
        _Seccion(
          titulo: '2. color: indigo, teal, deepOrange',
          child: Wrap(
            spacing: 16,
            runSpacing: 8,
            children: const [
              Text('Indigo', style: TextStyle(fontSize: 22, color: Colors.indigo)),
              Text('Teal', style: TextStyle(fontSize: 22, color: Colors.teal)),
              Text('DeepOrange', style: TextStyle(fontSize: 22, color: Colors.deepOrange)),
            ],
          ),
        ),

        // 3. textAlign.center: sin y con SizedBox(width: double.infinity)
        _Seccion(
          titulo: '3. textAlign.center (¿cambia algo?)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sin SizedBox: el Text solo ocupa el ancho de su '
                'contenido, así que textAlign no produce ningún cambio visible.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.indigo.withOpacity(0.08),
                child: const Text(
                  'Hola Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Con SizedBox(width: double.infinity): el Text ahora '
                'ocupa todo el ancho disponible y sí se centra.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.teal.withOpacity(0.08),
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Hola Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 4. overflow: ellipsis + maxLines: 1
        _Seccion(
          titulo: '4. overflow: TextOverflow.ellipsis + maxLines: 1',
          child: Container(
            width: 220,
            color: Colors.deepOrange.withOpacity(0.08),
            child: const Text(
              'Este es un texto bastante largo que definitivamente no '
              'cabe en una sola línea con este ancho tan limitado',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),

        // 5. shadows
        _Seccion(
          titulo: '5. shadows',
          child: const Text(
            'Hola Flutter',
            style: TextStyle(
              fontSize: 32,
              color: Colors.indigo,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),

        // 6. SelectableText en lugar de Text
        _Seccion(
          titulo: '6. SelectableText (mantén presionado o doble toque)',
          child: const SelectableText(
            'Hola Flutter',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

/// Pequeño widget de ayuda para mostrar cada experimento con su título
/// y un separador, así se ve claramente el "antes/después" de cada cambio.
class _Seccion extends StatelessWidget {
  final String titulo;
  final Widget child;

  const _Seccion({required this.titulo, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          child,
          const Divider(height: 32),
        ],
      ),
    );
  }
}