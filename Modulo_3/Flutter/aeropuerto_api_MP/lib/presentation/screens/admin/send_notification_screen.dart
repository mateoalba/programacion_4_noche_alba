import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/admin_vuelos_provider.dart';
import '../../widgets/admin_shell.dart';
import '../../../domain/model/vuelo.dart';
import '../../../theme/app_colors.dart';

class SendNotificationScreen extends ConsumerStatefulWidget {
  const SendNotificationScreen({super.key});

  @override
  ConsumerState<SendNotificationScreen> createState() =>
      _SendNotificationScreenState();
}

class _SendNotificationScreenState
    extends ConsumerState<SendNotificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mensajeCtrl = TextEditingController();
  final _asuntoCtrl = TextEditingController();
  Vuelo? _vueloSeleccionado;
  String _tipoNotificacion = 'Informativa';
  bool _enviando = false;

  final _tipos = [
    'Informativa',
    'Retraso',
    'Cambio de Puerta',
    'Cancelación',
    'Abordaje',
    'Emergencia',
  ];

  @override
  void dispose() {
    _mensajeCtrl.dispose();
    _asuntoCtrl.dispose();
    super.dispose();
  }

  Future<void> _enviar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _enviando = true);

    // Simulate sending
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _enviando = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _vueloSeleccionado != null
                ? 'Notificación enviada al vuelo ${_vueloSeleccionado!.codigo}'
                : 'Notificación enviada a todos los vuelos',
          ),
          backgroundColor: AppColors.success,
        ),
      );
      _mensajeCtrl.clear();
      _asuntoCtrl.clear();
      setState(() => _vueloSeleccionado = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final adminState = ref.watch(adminVuelosProvider);

    return AdminShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.notifications_active,
                size: 48,
                color: AppColors.accent,
              ),
              const SizedBox(height: 12),
              const Text(
                'Enviar Notificación',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Envíe notificaciones a pasajeros de vuelos específicos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondaryDark,
                ),
              ),
              const SizedBox(height: 28),
              DropdownButtonFormField<String>(
                value: _tipoNotificacion,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Notificación',
                  prefixIcon: Icon(Icons.category),
                ),
                items: _tipos
                    .map((t) => DropdownMenuItem(
                          value: t,
                          child: Text(t),
                        ))
                    .toList(),
                onChanged: (v) {
                  if (v != null) {
                    setState(() => _tipoNotificacion = v);
                  }
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<Vuelo>(
                value: _vueloSeleccionado,
                decoration: const InputDecoration(
                  labelText: 'Vuelo Destino (opcional)',
                  hintText: 'Todos los vuelos',
                  prefixIcon: Icon(Icons.flight),
                ),
                items: adminState.vuelos
                    .map((v) => DropdownMenuItem(
                          value: v,
                          child: Text(
                              '${v.codigo} - ${v.aerolinea}'),
                        ))
                    .toList(),
                onChanged: (v) {
                  setState(() => _vueloSeleccionado = v);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _asuntoCtrl,
                decoration: const InputDecoration(
                  labelText: 'Asunto',
                  hintText: 'Ej: Cambio de puerta de embarque',
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'El asunto es obligatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _mensajeCtrl,
                decoration: const InputDecoration(
                  labelText: 'Mensaje',
                  hintText: 'Escriba el mensaje a enviar...',
                  prefixIcon: Icon(Icons.message),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'El mensaje es obligatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _enviando ? null : _enviar,
                icon: _enviando
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.send),
                label: Text(
                    _enviando ? 'Enviando...' : 'Enviar Notificación'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: _tipoNotificacion == 'Emergencia'
                      ? AppColors.error
                      : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
