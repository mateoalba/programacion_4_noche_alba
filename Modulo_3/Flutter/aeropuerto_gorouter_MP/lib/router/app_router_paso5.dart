import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../screens/pantalla_login.dart';
import '../screens/scaffold_con_nav.dart';
import '../screens/pantalla_vuelos.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_ajustes.dart';

GoRouter appRouterPaso5(WidgetRef ref) => GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final authState = ref.read(authProvider);
    final estaLogueado = authState is Autenticado;
    final esLogin = state.matchedLocation == '/login';

    if (!estaLogueado && !esLogin) return '/login';
    if (estaLogueado && esLogin) return '/vuelos';
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (_, _) => const PantallaLogin(),
    ),
    ShellRoute(
      builder: (_, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path: '/vuelos',
          builder: (_, _) => const PantallaVuelos(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (_, state) {
                final id = state.pathParameters['id']!;
                return PantallaDetalle(id: id);
              },
            ),
          ],
        ),
        GoRoute(path: '/ajustes', builder: (_, _) => const PantallaAjustes()),
      ],
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription =
        stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
