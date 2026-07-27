import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../../domain/model/auth_state.dart';
import '../../theme/app_colors.dart';

class AdminShell extends ConsumerWidget {
  final Widget child;
  final Widget? floatingActionButton;
  const AdminShell({super.key, required this.child, this.floatingActionButton});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Control'),
        actions: [
          if (authState is Autenticado)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CircleAvatar(
                backgroundColor: AppColors.accent,
                radius: 16,
                child: Text(
                  authState.usuario.iniciales,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
      drawer: _construirDrawer(context, ref, authState),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _construirDrawer(
      BuildContext context, WidgetRef ref, AuthState authState) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryDark, AppColors.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.airplanemode_active,
                    color: AppColors.accent,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Control de Vuelos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    authState is Autenticado
                        ? authState.usuario.nombre
                        : 'Operador',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _itemDrawer(
              icon: Icons.dashboard,
              titulo: 'Dashboard',
              onTap: () {
                Navigator.pop(context);
                context.go('/admin/dashboard');
              },
            ),
            _itemDrawer(
              icon: Icons.flight,
              titulo: 'Gestionar Vuelos',
              onTap: () {
                Navigator.pop(context);
                context.go('/admin/vuelos');
              },
            ),
            _itemDrawer(
              icon: Icons.people,
              titulo: 'Gestionar Pasajeros',
              onTap: () {
                Navigator.pop(context);
                context.go('/admin/pasajeros');
              },
            ),
            _itemDrawer(
              icon: Icons.notifications_active,
              titulo: 'Enviar Notificaciones',
              onTap: () {
                Navigator.pop(context);
                context.go('/admin/notificaciones');
              },
            ),
            const Divider(),
            _itemDrawer(
              icon: Icons.person,
              titulo: 'Mi Perfil',
              onTap: () {
                Navigator.pop(context);
                context.go('/perfil');
              },
            ),
            _itemDrawer(
              icon: Icons.flight_takeoff,
              titulo: 'Ver Vuelos',
              onTap: () {
                Navigator.pop(context);
                context.go('/vuelos');
              },
            ),
            const Spacer(),
            _itemDrawer(
              icon: Icons.logout,
              titulo: 'Cerrar Sesión',
              color: AppColors.error,
              onTap: () async {
                Navigator.pop(context);
                await ref.read(authProvider.notifier).logout();
                if (context.mounted) {
                  context.go('/login');
                }
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _itemDrawer({
    required IconData icon,
    required String titulo,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColors.textSecondaryDark),
      title: Text(
        titulo,
        style: TextStyle(
          color: color ?? AppColors.textPrimaryDark,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
    );
  }
}
