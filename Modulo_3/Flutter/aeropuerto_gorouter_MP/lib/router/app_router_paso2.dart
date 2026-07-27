import 'package:go_router/go_router.dart';
import '../screens/pantalla_vuelos.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_inicio.dart';

final appRouterPaso2 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, _) => const PantallaInicio()),
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
  ],
);
