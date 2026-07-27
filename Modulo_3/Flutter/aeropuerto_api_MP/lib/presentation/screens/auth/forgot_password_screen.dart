import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/forgot_password_provider.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_text_field.dart';
import '../../../theme/app_colors.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _enviar() async {
    if (!_formKey.currentState!.validate()) return;
    await ref
        .read(forgotPasswordProvider.notifier)
        .enviarCorreo(_emailCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forgotPasswordProvider);

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
                    Icons.lock_reset,
                    size: 48,
                    color: AppColors.accent,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Recuperar Contraseña',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ingrese su correo para recibir un enlace de recuperación',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (state.enviado)
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: AppColors.success.withValues(alpha: 0.3)),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.mark_email_read,
                              color: AppColors.success, size: 32),
                          const SizedBox(height: 8),
                          const Text(
                            'Correo enviado exitosamente',
                            style: TextStyle(
                              color: AppColors.success,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Revise su bandeja de entrada y siga las instrucciones.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textSecondaryDark,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => context.go('/reset-password'),
                            child: const Text(
                                'Ya tengo el código de recuperación'),
                          ),
                        ],
                      ),
                    )
                  else ...[
                    AuthTextField(
                      labelText: 'Correo Electrónico',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailCtrl,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'El correo es obligatorio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    if (state.error != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          state.error!,
                          style: const TextStyle(color: AppColors.error),
                        ),
                      ),
                    AuthButton(
                      texto: 'Enviar Correo',
                      cargando: state.cargando,
                      icono: Icons.send,
                      onPressed: _enviar,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
