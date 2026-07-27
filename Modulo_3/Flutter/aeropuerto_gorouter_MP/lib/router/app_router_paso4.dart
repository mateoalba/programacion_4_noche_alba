import 'package:go_router/go_router.dart';
import '../screens/scaffold_con_nav.dart';
import '../screens/pantalla_vuelos.dart';
import '../screens/pantalla_metricas.dart';
import '../screens/pantalla_ajustes.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/vuelos',
  routes: [
    ShellRoute(
      builder: (_, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(path: '/vuelos', builder: (_, _) => const PantallaVuelos()),
        GoRoute(path: '/metricas', builder: (_, _) => const PantallaMetricas()),
        GoRoute(path: '/ajustes', builder: (_, _) => const PantallaAjustes()),
      ],
    ),
  ],
);
