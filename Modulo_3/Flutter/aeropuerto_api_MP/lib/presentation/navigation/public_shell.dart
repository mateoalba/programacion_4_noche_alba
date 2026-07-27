import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PublicShell extends ConsumerStatefulWidget {
  final Widget child;
  const PublicShell({super.key, required this.child});

  @override
  ConsumerState<PublicShell> createState() => _PublicShellState();
}

class _PublicShellState extends ConsumerState<PublicShell> {
  int _currentIndex = 0;

  final _rutas = ['/vuelos', '/pasajeros', '/perfil'];

  @override
  Widget build(BuildContext context) {
    final location =
        GoRouterState.of(context).uri.toString();

    if (location.startsWith('/vuelos')) {
      _currentIndex = 0;
    } else if (location.startsWith('/pasajeros')) {
      _currentIndex = 1;
    } else if (location.startsWith('/perfil')) {
      _currentIndex = 2;
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'Vuelos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Pasajeros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          setState(() => _currentIndex = index);
          context.go(_rutas[index]);
        },
      ),
    );
  }
}
