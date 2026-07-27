import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import '../../../domain/model/auth_state.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_text_field.dart';
import '../../../theme/app_colors.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmarCtrl = TextEditingController();
  bool _cargando = false;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmarCtrl.dispose();
    super.dispose();
  }

  Future<void> _registrar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _cargando = true);

    final exito = await ref.read(authProvider.notifier).register(
          _usernameCtrl.text.trim(),
          _emailCtrl.text.trim(),
          _passwordCtrl.text,
        );

    setState(() => _cargando = false);

    if (exito && mounted) {
      context.go('/vuelos');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_add,
                    size: 48,
                    color: AppColors.accent,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Registre un nuevo usuario del sistema',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AuthTextField(
                    labelText: 'Nombre de Usuario',
                    prefixIcon: Icons.person,
                    controller: _usernameCtrl,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'El usuario es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    labelText: 'Correo Electrónico',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailCtrl,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'El correo es obligatorio';
                      }
                      if (!v.contains('@')) return 'Correo inválido';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outline,
                    esPassword: true,
                    controller: _passwordCtrl,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'La contraseña es obligatoria';
                      }
                      if (v.length < 6) {
                        return 'Mínimo 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    labelText: 'Confirmar Contraseña',
                    prefixIcon: Icons.lock_outline,
                    esPassword: true,
                    controller: _confirmarCtrl,
                    validator: (v) {
                      if (v != _passwordCtrl.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  if (authState is ErrorAuth)
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        authState.mensaje,
                        style: const TextStyle(color: AppColors.error),
                      ),
                    ),
                  AuthButton(
                    texto: 'Crear Cuenta',
                    cargando: _cargando,
                    icono: Icons.person_add,
                    onPressed: _registrar,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tiene cuenta? ',
                        style:
                            TextStyle(color: AppColors.textSecondaryDark),
                      ),
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
