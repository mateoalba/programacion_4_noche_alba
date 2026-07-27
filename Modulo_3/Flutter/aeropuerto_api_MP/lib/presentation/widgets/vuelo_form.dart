import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/model/vuelo.dart';
import '../../../core/utils/validators.dart';
import '../../../theme/app_colors.dart';

class VueloForm extends ConsumerStatefulWidget {
  final Vuelo? vuelo;
  final Function(Vuelo) onGuardar;

  const VueloForm({
    super.key,
    this.vuelo,
    required this.onGuardar,
  });

  @override
  ConsumerState<VueloForm> createState() => _VueloFormState();
}

class _VueloFormState extends ConsumerState<VueloForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _codigoCtrl;
  late TextEditingController _aerolineaCtrl;
  late TextEditingController _origenCtrl;
  late TextEditingController _destinoCtrl;
  late TextEditingController _puertaCtrl;
  late TextEditingController _pasajerosCtrl;
  late TextEditingController _capacidadCtrl;

  String _estado = 'programado';
  bool _internacional = false;
  DateTime _fechaSalida = DateTime.now();

  final _estadosDisponibles = [
    'programado',
    'abordando',
    'en_vuelo',
    'retrasado',
    'cancelado',
    'aterrizado',
    'embarque',
  ];

  @override
  void initState() {
    super.initState();
    final v = widget.vuelo;
    _codigoCtrl = TextEditingController(text: v?.codigoVuelo ?? '');
    _aerolineaCtrl = TextEditingController(text: v?.aerolineaNombre.isNotEmpty == true ? v?.aerolineaNombre : v?.aerolinea ?? '');
    _origenCtrl = TextEditingController(text: v?.origenCodigo.isNotEmpty == true ? v?.origenCodigo : v?.origen ?? '');
    _destinoCtrl = TextEditingController(text: v?.destinoCodigo.isNotEmpty == true ? v?.destinoCodigo : v?.destino ?? '');
    _puertaCtrl = TextEditingController(text: v?.puertaCodigo.isNotEmpty == true ? v?.puertaCodigo : v?.puerta ?? '');
    _pasajerosCtrl = TextEditingController(
        text: v?.pasajerosAbordados.toString() ?? '0');
    _capacidadCtrl = TextEditingController(
        text: v?.capacidad.toString() ?? '180');

    if (v != null) {
      _estado = v.estado;
      _internacional = v.internacional;
      _fechaSalida = v.fechaSalida;
    }
  }

  @override
  void dispose() {
    _codigoCtrl.dispose();
    _aerolineaCtrl.dispose();
    _origenCtrl.dispose();
    _destinoCtrl.dispose();
    _puertaCtrl.dispose();
    _pasajerosCtrl.dispose();
    _capacidadCtrl.dispose();
    super.dispose();
  }

  void _seleccionarFecha() async {
    final fecha = await showDatePicker(
      context: context,
      initialDate: _fechaSalida,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (fecha != null && mounted) {
      final hora = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_fechaSalida),
      );
      setState(() {
        _fechaSalida = DateTime(
          fecha.year,
          fecha.month,
          fecha.day,
          hora?.hour ?? _fechaSalida.hour,
          hora?.minute ?? _fechaSalida.minute,
        );
      });
    }
  }

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      final vuelo = Vuelo(
        id: widget.vuelo?.id ?? '',
        codigoVuelo: _codigoCtrl.text.trim().toUpperCase(),
        aerolinea: _aerolineaCtrl.text.trim(),
        origen: _origenCtrl.text.trim().toUpperCase(),
        destino: _destinoCtrl.text.trim().toUpperCase(),
        puerta: _puertaCtrl.text.trim().toUpperCase(),
        estado: _estado,
        fechaSalida: _fechaSalida,
        capacidad: int.tryParse(_capacidadCtrl.text) ?? 180,
        pasajerosAbordados: int.tryParse(_pasajerosCtrl.text) ?? 0,
        internacional: _internacional,
      );
      widget.onGuardar(vuelo);
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
            TextFormField(
              controller: _codigoCtrl,
              decoration: const InputDecoration(
                labelText: 'Código de Vuelo',
                hintText: 'Ej: AV1234',
                prefixIcon: Icon(Icons.flight),
              ),
              validator: Validators.validateCodigoVuelo,
              textCapitalization: TextCapitalization.characters,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _aerolineaCtrl,
              decoration: const InputDecoration(
                labelText: 'Aerolínea',
                hintText: 'Ej: Avianca',
                prefixIcon: Icon(Icons.business),
              ),
              validator: Validators.validateAerolinea,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _origenCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Origen',
                      hintText: 'Ej: BOG',
                      prefixIcon: Icon(Icons.flight_takeoff),
                    ),
                    validator: Validators.validateOrigen,
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _destinoCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Destino',
                      hintText: 'Ej: MIA',
                      prefixIcon: Icon(Icons.flight_land),
                    ),
                    validator: Validators.validateDestino,
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _puertaCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Puerta',
                      hintText: 'Ej: A12',
                      prefixIcon: Icon(Icons.door_front_door),
                    ),
                    validator: Validators.validatePuerta,
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _estado,
                    decoration: const InputDecoration(
                      labelText: 'Estado',
                      prefixIcon: Icon(Icons.flag),
                    ),
                    items: _estadosDisponibles
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) setState(() => _estado = v);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _seleccionarFecha,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Fecha y Hora de Salida',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                child: Text(
                  '${_fechaSalida.day}/${_fechaSalida.month}/${_fechaSalida.year} ${_fechaSalida.hour.toString().padLeft(2, '0')}:${_fechaSalida.minute.toString().padLeft(2, '0')}',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _pasajerosCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Pasajeros',
                      prefixIcon: Icon(Icons.people),
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validators.validatePasajeros,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _capacidadCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Capacidad',
                      prefixIcon: Icon(Icons.airline_seat_flat),
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validators.validateCapacidad,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Vuelo Internacional'),
              value: _internacional,
              onChanged: (v) => setState(() => _internacional = v),
              activeColor: AppColors.accent,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _guardar,
              icon: Icon(widget.vuelo != null ? Icons.save : Icons.add),
              label: Text(
                widget.vuelo != null ? 'Actualizar Vuelo' : 'Crear Vuelo',
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
