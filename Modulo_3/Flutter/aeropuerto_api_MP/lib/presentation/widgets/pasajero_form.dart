import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/model/pasajero.dart';
import '../../../core/utils/validators.dart';
import '../../../core/utils/formatters.dart';
import '../../../theme/app_colors.dart';

class PasajeroForm extends ConsumerStatefulWidget {
  final Pasajero? pasajero;
  final String? vueloCodigoInicial;
  final Function(Pasajero) onGuardar;

  const PasajeroForm({
    super.key,
    this.pasajero,
    this.vueloCodigoInicial,
    required this.onGuardar,
  });

  @override
  ConsumerState<PasajeroForm> createState() => _PasajeroFormState();
}

class _PasajeroFormState extends ConsumerState<PasajeroForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nombreCtrl;
  late TextEditingController _apellidoCtrl;
  late TextEditingController _documentoCtrl;
  late TextEditingController _vueloCodigoCtrl;
  late TextEditingController _asientoCtrl;

  String _tipoDocumento = 'CC';
  String _estadoEmbarque = 'pendiente';
  bool _vip = false;

  final _tiposDocumento = ['CC', 'CE', 'Pasaporte', 'TI'];
  final _estadosEmbarque = ['pendiente', 'abordado', 'ausente'];

  @override
  void initState() {
    super.initState();
    final p = widget.pasajero;
    _nombreCtrl = TextEditingController(text: p?.nombre ?? '');
    _apellidoCtrl = TextEditingController(text: p?.apellido ?? '');
    _documentoCtrl = TextEditingController(text: p?.documento ?? '');
    _vueloCodigoCtrl = TextEditingController(
        text: p?.vueloCodigo ?? widget.vueloCodigoInicial ?? '');
    _asientoCtrl = TextEditingController(text: p?.asiento ?? '');

    if (p != null) {
      _tipoDocumento = p.tipoDocumento;
      _estadoEmbarque = p.estadoEmbarque;
      _vip = p.vip;
    }
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _apellidoCtrl.dispose();
    _documentoCtrl.dispose();
    _vueloCodigoCtrl.dispose();
    _asientoCtrl.dispose();
    super.dispose();
  }

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      final pasajero = Pasajero(
        id: widget.pasajero?.id ?? '',
        nombre: _nombreCtrl.text.trim(),
        apellido: _apellidoCtrl.text.trim(),
        documento: _documentoCtrl.text.trim(),
        tipoDocumento: _tipoDocumento,
        vueloCodigo: _vueloCodigoCtrl.text.trim().toUpperCase(),
        asiento: _asientoCtrl.text.trim().toUpperCase(),
        estadoEmbarque: _estadoEmbarque,
        vip: _vip,
      );
      widget.onGuardar(pasajero);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _nombreCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (v) => Validators.validateRequired(v, 'Nombre'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _apellidoCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Apellido',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (v) => Validators.validateRequired(v, 'Apellido'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: DropdownButtonFormField<String>(
                    value: _tipoDocumento,
                    decoration: const InputDecoration(
                      labelText: 'Tipo',
                    ),
                    items: _tiposDocumento
                        .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) setState(() => _tipoDocumento = v);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _documentoCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Documento',
                      prefixIcon: Icon(Icons.confirmation_number),
                    ),
                    validator: Validators.validateDocumento,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _vueloCodigoCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Código de Vuelo',
                      hintText: 'Ej: AV1234',
                      prefixIcon: Icon(Icons.flight),
                    ),
                    validator: (v) =>
                        Validators.validateRequired(v, 'Código de vuelo'),
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _asientoCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Asiento',
                      hintText: 'Ej: 12A',
                      prefixIcon: Icon(Icons.airline_seat_recline_normal),
                    ),
                    validator: Validators.validateAsiento,
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _estadoEmbarque,
              decoration: const InputDecoration(
                labelText: 'Estado de Embarque',
                prefixIcon: Icon(Icons.flag),
              ),
              items: _estadosEmbarque
                  .map((e) => DropdownMenuItem(value: e, child: Text(Formatters.formatEstadoEmbarque(e))))
                  .toList(),
              onChanged: (v) {
                if (v != null) setState(() => _estadoEmbarque = v);
              },
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Pasajero VIP'),
              value: _vip,
              onChanged: (v) => setState(() => _vip = v),
              activeColor: AppColors.accent,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _guardar,
              icon: Icon(widget.pasajero != null ? Icons.save : Icons.person_add),
              label: Text(
                widget.pasajero != null
                    ? 'Actualizar Pasajero'
                    : 'Registrar Pasajero',
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
