import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../../domain/model/auth_state.dart';
import 'public_shell.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/reset_password_confirm_screen.dart';
import '../screens/auth/profile_screen.dart';
import '../screens/vuelos/vuelos_screen.dart';
import '../screens/vuelos/vuelo_detail_screen.dart';
import '../screens/vuelos/vuelos_home_screen.dart';
import '../screens/pasajeros/pasajeros_screen.dart';
import '../screens/pasajeros/pasajero_detail_screen.dart';
import '../screens/admin/dashboard_screen.dart';
import '../screens/admin/vuelos_admin_screen.dart';
import '../screens/admin/pasajeros_admin_screen.dart';
import '../screens/admin/send_notification_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final estaAutenticado = authState is Autenticado;
      final ruta = state.uri.toString();

      final rutasPublicas = [
        '/login',
        '/register',
        '/forgot-password',
        '/reset-password',
      ];

      final esRutaPublica = rutasPublicas.contains(ruta);
      final esRutaAdmin = ruta.startsWith('/admin');

      if (!estaAutenticado && !esRutaPublica) {
        return '/login';
      }

      if (estaAutenticado && esRutaPublica) {
        return '/vuelos';
      }

      if (esRutaAdmin && estaAutenticado) {
        if (authState.usuario.rol != 'admin') {
          return '/vuelos';
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/reset-password',
        name: 'resetPassword',
        builder: (context, state) =>
            const ResetPasswordConfirmScreen(),
      ),
      GoRoute(
        path: '/perfil',
        name: 'perfil',
        builder: (context, state) => const ProfileScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => PublicShell(child: child),
        routes: [
          GoRoute(
            path: '/vuelos',
            name: 'vuelos',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: VuelosHomeScreen()),
            routes: [
              GoRoute(
                path: 'lista',
                name: 'vuelosLista',
                builder: (context, state) => const VuelosScreen(),
              ),
              GoRoute(
                path: 'detalle/:id',
                name: 'vueloDetalle',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return VueloDetailScreen(vueloId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/pasajeros',
            name: 'pasajeros',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: PasajerosScreen()),
            routes: [
              GoRoute(
                path: 'detalle/:id',
                name: 'pasajeroDetalle',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return PasajeroDetailScreen(pasajeroId: id);
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/admin/dashboard',
        name: 'adminDashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/admin/vuelos',
        name: 'adminVuelos',
        builder: (context, state) => const VuelosAdminScreen(),
        routes: [
          GoRoute(
            path: 'detalle/:id',
            name: 'adminVueloDetalle',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return VueloDetailScreen(vueloId: id);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/admin/pasajeros',
        name: 'adminPasajeros',
        builder: (context, state) => const PasajerosAdminScreen(),
        routes: [
          GoRoute(
            path: 'detalle/:id',
            name: 'adminPasajeroDetalle',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return PasajeroDetailScreen(pasajeroId: id);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/admin/notificaciones',
        name: 'adminNotificaciones',
        builder: (context, state) =>
            const SendNotificationScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline,
                size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Página no encontrada',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.uri.toString(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/vuelos'),
              child: const Text('Ir a Vuelos'),
            ),
          ],
        ),
      ),
    ),
  );
});
