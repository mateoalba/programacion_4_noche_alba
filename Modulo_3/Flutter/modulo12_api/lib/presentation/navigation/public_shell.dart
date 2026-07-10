import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/cart_provider.dart';

class PublicShell extends ConsumerWidget {
  final Widget child;
  const PublicShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final itemCount = cartState.itemCount;
    final location = GoRouterState.of(context).matchedLocation;

    final currentIndex = switch (location) {
      '/'        => 0,
      '/catalog' => 1,
      '/profile' => 2,
      _          => 0,
    };

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0: context.go('/');
            case 1: context.go('/catalog');
            case 2: context.go('/profile');
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: itemCount > 0
                ? Badge(
                    label: Text(
                      itemCount > 99 ? '99+' : itemCount.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                    child: const Icon(Icons.shopping_bag_outlined),
                  )
                : const Icon(Icons.shopping_bag_outlined),
            activeIcon: itemCount > 0
                ? Badge(
                    label: Text(
                      itemCount > 99 ? '99+' : itemCount.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                    child: const Icon(Icons.shopping_bag),
                  )
                : const Icon(Icons.shopping_bag),
            label: 'Catálogo',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
