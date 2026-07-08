import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/model/auth_state.dart';
import '../providers/auth_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(child: CircularProgressIndicator()),
  );
}

class _PlaceholderScreen extends ConsumerWidget {
  final String title;
  const _PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            tooltip: 'Cerrar sesión',
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
              context.go('/login');
            },
          ),
        ],
      ),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 18))),
    );
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: _AuthStateListenable(ref),
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isChecking = authState.isChecking;
      final isAuth     = authState.isAuthenticated;
      final isStaff    = authState.isStaff;
      final location   = state.matchedLocation;

      if (isChecking) {
        return location == '/splash' ? null : '/splash';
      }

      final isAuthRoute = location == '/login' || location == '/register';
      final isSplash    = location == '/splash';

      if (isSplash) return isAuth ? (isStaff ? '/admin' : '/') : '/login';

      if (!isAuth && !isAuthRoute) return '/login';

      if (isAuth && isAuthRoute) return isStaff ? '/admin' : '/';

      if (isAuth && !isStaff && location.startsWith('/admin')) return '/';

      return null;
    },
    routes: [
      GoRoute(
        path:    '/splash',
        builder: (_, _) => const _SplashScreen(),
      ),
      GoRoute(
        path:    '/login',
        builder: (_, _) => const LoginScreen(),
      ),
      GoRoute(
        path:    '/register',
        builder: (_, _) => const RegisterScreen(),
      ),
      GoRoute(
        path:    '/',
        builder: (_, _) => const _PlaceholderScreen('Home — M5'),
      ),
      GoRoute(
        path:    '/catalog',
        builder: (_, _) => const _PlaceholderScreen('Catálogo — M5'),
      ),
      GoRoute(
        path:    '/product/:id',
        builder: (_, _) => const _PlaceholderScreen('Detalle — M5'),
      ),
      GoRoute(
        path:    '/orders',
        builder: (_, _) => const _PlaceholderScreen('Mis pedidos — M7'),
      ),
      GoRoute(
        path:    '/profile',
        builder: (_, _) => const _PlaceholderScreen('Perfil — M7'),
      ),
      GoRoute(
        path:    '/admin',
        builder: (_, _) => const _PlaceholderScreen('Dashboard — M8'),
      ),
    ],
  );
});

class _AuthStateListenable extends ChangeNotifier {
  _AuthStateListenable(Ref ref) {
    ref.listen<AuthState>(authProvider, (_, _) => notifyListeners());
  }
}
