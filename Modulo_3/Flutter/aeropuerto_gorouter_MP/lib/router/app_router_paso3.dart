import 'package:go_router/go_router.dart';
import '../screens/pantalla_vuelos_filtro.dart';
import '../screens/pantalla_inicio.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, _) => const PantallaInicio()),
    GoRoute(
      path: '/vuelos',
      builder: (_, state) {
        final soloInternacionales =
            state.uri.queryParameters['internacional'] == 'true';
        return PantallaVuelosFiltro(
            soloInternacionales: soloInternacionales);
      },
    ),
  ],
);
