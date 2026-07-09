import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/model/auth_state.dart';
import '../providers/auth_provider.dart';
import '../screens/admin/dashboard_screen.dart';
import '../screens/admin/categories_admin_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/profile_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/catalog/catalog_screen.dart';
import '../screens/catalog/home_screen.dart';
import '../screens/catalog/product_detail_screen.dart';
import '../screens/orders/order_detail_screen.dart';
import '../screens/orders/orders_screen.dart';
import '../widgets/admin_shell.dart';
import 'public_shell.dart';

class _AdminPlaceholder extends StatelessWidget {
  final String title;
  const _AdminPlaceholder(this.title);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(title,
            style: const TextStyle(color: Color(0xFF8888AA), fontSize: 16)),
      );
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: _AuthStateListenable(ref),
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isAuth  = authState.isAuthenticated;
      final isStaff = authState.isStaff;
      final location = state.matchedLocation;

      final isAuthRoute = location == '/login' || location == '/register';

      if (!isAuth && !isAuthRoute) return '/login';

      if (isAuth && isAuthRoute) return isStaff ? '/admin' : '/';

      if (isAuth && !isStaff && location.startsWith('/admin')) return '/';

      return null;
    },
    routes: [
      ShellRoute(
        builder: (_, __, child) => PublicShell(child: child),
        routes: [
          GoRoute(
            path:    '/',
            builder: (_, __) => const HomeScreen(),
          ),
          GoRoute(
            path:    '/catalog',
            builder: (_, __) => const CatalogScreen(),
          ),
          GoRoute(
            path:    '/cart',
            builder: (_, __) => const CartScreen(),
          ),
          GoRoute(
            path:    '/orders',
            builder: (_, __) => const OrdersScreen(),
          ),
          GoRoute(
            path:    '/profile',
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path:    '/login',
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path:    '/register',
        builder: (_, __) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/catalog/:id',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ProductDetailScreen(productId: id);
        },
      ),
      GoRoute(
        path: '/orders/:id',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          return OrderDetailScreen(orderId: id);
        },
      ),
      GoRoute(
        path: '/admin',
        builder: (_, state) => AdminShell(
          title:        'Dashboard',
          currentRoute: state.matchedLocation,
          child:        const DashboardScreen(),
        ),
      ),
      GoRoute(
        path: '/admin/categories',
        builder: (_, state) => AdminShell(
          title:        'Categorías',
          currentRoute: state.matchedLocation,
          child:        const CategoriesAdminScreen(),
        ),
      ),
      GoRoute(
        path: '/admin/products',
        builder: (_, state) => AdminShell(
          title:        'Productos',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Productos — M9'),
        ),
      ),
      GoRoute(
        path: '/admin/orders',
        builder: (_, state) => AdminShell(
          title:        'Pedidos',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Pedidos admin — M10'),
        ),
      ),
      GoRoute(
        path: '/admin/orders/:id',
        builder: (_, state) => AdminShell(
          title:        'Detalle pedido',
          currentRoute: '/admin/orders',
          child:        _AdminPlaceholder(
              'Pedido #${state.pathParameters['id']} — M10'),
        ),
      ),
      GoRoute(
        path: '/admin/users',
        builder: (_, state) => AdminShell(
          title:        'Usuarios',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Usuarios — M11'),
        ),
      ),
    ],
  );
});

class _AuthStateListenable extends ChangeNotifier {
  _AuthStateListenable(Ref ref) {
    ref.listen<AuthState>(authProvider, (_, __) => notifyListeners());
  }
}
