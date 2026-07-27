import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../../domain/model/auth_state.dart';
import '../../providers/profile_provider.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/user_avatar.dart';
import '../../../theme/app_colors.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late TextEditingController _nombreCtrl;
  late TextEditingController _emailCtrl;
  bool _editando = false;

  @override
  void initState() {
    super.initState();
    final authState = ref.read(authProvider);
    final usuario = authState is Autenticado ? authState.usuario : null;
    _nombreCtrl = TextEditingController(text: usuario?.nombre ?? '');
    _emailCtrl = TextEditingController(text: usuario?.email ?? '');
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _guardarPerfil() async {
    final exito = await ref.read(profileProvider.notifier).actualizarPerfil({
      'nombre': _nombreCtrl.text.trim(),
      'email': _emailCtrl.text.trim(),
    });
    if (exito && mounted) {
      setState(() => _editando = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil actualizado exitosamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final profileState = ref.watch(profileProvider);
    final usuario = authState is Autenticado ? authState.usuario : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        actions: [
          if (usuario?.esAdmin == true)
            IconButton(
              icon: const Icon(Icons.admin_panel_settings),
              onPressed: () => context.go('/admin/dashboard'),
              tooltip: 'Panel Admin',
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: UserAvatar(
                usuario: usuario,
                radio: 48,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              usuario?.nombre ?? 'Usuario',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              usuario?.email ?? '',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondaryDark,
              ),
            ),
            if (usuario?.rol != null) ...[
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: AppColors.accent.withValues(alpha: 0.3)),
                ),
                child: Text(
                  usuario!.rol!.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Información Personal',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accent,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _editando ? Icons.close : Icons.edit,
                            color: AppColors.textSecondaryDark,
                          ),
                          onPressed: () {
                            setState(() => _editando = !_editando);
                            if (!_editando && usuario != null) {
                              _nombreCtrl.text = usuario.nombre;
                              _emailCtrl.text = usuario.email;
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (_editando) ...[
                      AuthTextField(
                        labelText: 'Nombre',
                        prefixIcon: Icons.person,
                        controller: _nombreCtrl,
                      ),
                      const SizedBox(height: 16),
                      AuthTextField(
                        labelText: 'Correo',
                        prefixIcon: Icons.email,
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      AuthButton(
                        texto: 'Guardar Cambios',
                        cargando: profileState.guardando,
                        icono: Icons.save,
                        onPressed: _guardarPerfil,
                      ),
                    ] else ...[
                      _infoFila(Icons.person, 'Nombre', usuario?.nombre ?? ''),
                      const SizedBox(height: 12),
                      _infoFila(Icons.email, 'Email', usuario?.email ?? ''),
                      const SizedBox(height: 12),
                      _infoFila(Icons.badge, 'Rol', usuario?.rol ?? 'Operador'),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.flight,
                        color: AppColors.primary),
                    title: const Text('Mis Vuelos'),
                    trailing:
                        const Icon(Icons.chevron_right, color: AppColors.textSecondaryDark),
                    onTap: () => context.go('/vuelos'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.people,
                        color: AppColors.primary),
                    title: const Text('Pasajeros'),
                    trailing:
                        const Icon(Icons.chevron_right, color: AppColors.textSecondaryDark),
                    onTap: () => context.go('/pasajeros'),
                  ),
                  if (usuario?.esAdmin == true) ...[
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.dashboard,
                          color: AppColors.accent),
                      title: const Text('Panel de Administración'),
                      trailing:
                          const Icon(Icons.chevron_right, color: AppColors.textSecondaryDark),
                      onTap: () => context.go('/admin/dashboard'),
                    ),
                  ],
                  const Divider(height: 1),
                  ListTile(
                    leading:
                        const Icon(Icons.logout, color: AppColors.error),
                    title: const Text(
                      'Cerrar Sesión',
                      style: TextStyle(color: AppColors.error),
                    ),
                    onTap: () async {
                      await ref.read(authProvider.notifier).logout();
                      if (context.mounted) {
                        context.go('/login');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoFila(IconData icon, String label, String valor) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondaryDark),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textDisabledDark,
              ),
            ),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textPrimaryDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
