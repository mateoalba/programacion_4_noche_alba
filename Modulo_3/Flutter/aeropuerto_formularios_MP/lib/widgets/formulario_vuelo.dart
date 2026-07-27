import 'package:flutter/material.dart';
import '../models/vuelo.dart';

class FormularioVuelo extends StatefulWidget {
  final void Function(Vuelo) onGuardar;
  final Vuelo? vuelo;

  const FormularioVuelo({super.key, required this.onGuardar, this.vuelo});

  @override
  State<FormularioVuelo> createState() => _FormularioVueloState();
}

class _FormularioVueloState extends State<FormularioVuelo> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _codigoCtrl;
  late final TextEditingController _aerolineaCtrl;
  late final TextEditingController _origenCtrl;
  late final TextEditingController _destinoCtrl;
  late final TextEditingController _puertaCtrl;
  late final TextEditingController _capacidadCtrl;

  String _estado = 'programado';
  bool _internacional = false;

  final List<String> _estados = [
    'programado',
    'abordando',
    'en_vuelo',
    'retrasado',
    'cancelado',
  ];

  bool get _esEdicion => widget.vuelo != null;

  @override
  void initState() {
    super.initState();
    _codigoCtrl = TextEditingController(text: widget.vuelo?.codigoVuelo ?? '');
    _aerolineaCtrl =
        TextEditingController(text: widget.vuelo?.aerolineaCodigo ?? '');
    _origenCtrl =
        TextEditingController(text: widget.vuelo?.origenCodigo ?? '');
    _destinoCtrl =
        TextEditingController(text: widget.vuelo?.destinoCodigo ?? '');
    _puertaCtrl =
        TextEditingController(text: widget.vuelo?.puertaCodigo ?? '');
    _capacidadCtrl = TextEditingController(
        text: widget.vuelo != null ? widget.vuelo!.capacidad.toString() : '');
    if (widget.vuelo != null) {
      _estado = widget.vuelo!.estado;
      _internacional = widget.vuelo!.internacional;
    }
  }

  @override
  void dispose() {
    _codigoCtrl.dispose();
    _aerolineaCtrl.dispose();
    _origenCtrl.dispose();
    _destinoCtrl.dispose();
    _puertaCtrl.dispose();
    _capacidadCtrl.dispose();
    super.dispose();
  }

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      final vuelo = Vuelo(
        id: widget.vuelo?.id ?? '',
        codigoVuelo: _codigoCtrl.text.trim().toUpperCase(),
        aerolineaCodigo: _aerolineaCtrl.text.trim().toUpperCase(),
        aerolineaNombre: widget.vuelo?.aerolineaNombre ?? '',
        origenCodigo: _origenCtrl.text.trim().toUpperCase(),
        destinoCodigo: _destinoCtrl.text.trim().toUpperCase(),
        puertaCodigo: _puertaCtrl.text.trim().toUpperCase(),
        estado: _estado,
        capacidad: int.parse(_capacidadCtrl.text),
        pasajerosAbordados: widget.vuelo?.pasajerosAbordados ?? 0,
        internacional: _internacional,
        fechaSalida: widget.vuelo?.fechaSalida,
        fechaLlegada: widget.vuelo?.fechaLlegada,
      );
      widget.onGuardar(vuelo);
      if (!_esEdicion) {
        _formKey.currentState!.reset();
        _codigoCtrl.clear();
        _aerolineaCtrl.clear();
        _origenCtrl.clear();
        _destinoCtrl.clear();
        _puertaCtrl.clear();
        _capacidadCtrl.clear();
        setState(() {
          _estado = 'programado';
          _internacional = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _esEdicion ? 'Editar Vuelo' : 'Registrar Vuelo',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _codigoCtrl,
                decoration: const InputDecoration(
                  labelText: 'Código de Vuelo',
                  hintText: 'Ej: AV1234',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flight),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Ingrese el código';
                  final regex = RegExp(r'^[A-Z]{2}\d{4}$');
                  if (!regex.hasMatch(v.trim().toUpperCase())) {
                    return 'Formato: 2 letras + 4 dígitos (ej: AV1234)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _aerolineaCtrl,
                decoration: const InputDecoration(
                  labelText: 'Código Aerolínea',
                  hintText: 'Ej: AV',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.airline_seat_recline_normal),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Ingrese el código de aerolínea' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _origenCtrl,
                decoration: const InputDecoration(
                  labelText: 'Código Origen',
                  hintText: 'Ej: UIO',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flight_takeoff),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Ingrese el código de origen' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _destinoCtrl,
                decoration: const InputDecoration(
                  labelText: 'Código Destino',
                  hintText: 'Ej: GYE',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flight_land),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Ingrese el código de destino' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _puertaCtrl,
                decoration: const InputDecoration(
                  labelText: 'Código Puerta',
                  hintText: 'Ej: A12',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.door_front_door),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Ingrese la puerta';
                  final regex = RegExp(r'^[A-Za-z]\d{1,3}$');
                  if (!regex.hasMatch(v.trim())) {
                    return 'Formato: letra + dígitos (ej: A12)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _estado,
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.info_outline),
                ),
                items: _estados
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => _estado = v ?? _estado),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _capacidadCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Capacidad',
                  hintText: '1 - 600',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.event_seat),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Ingrese capacidad';
                  final n = int.tryParse(v);
                  if (n == null || n < 1 || n > 600) {
                    return 'Ingrese un número entre 1 y 600';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('Vuelo internacional'),
                subtitle: const Text('Activar si el vuelo es internacional'),
                value: _internacional,
                onChanged: (v) => setState(() => _internacional = v),
                secondary: const Icon(Icons.public),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: _guardar,
                icon: Icon(_esEdicion ? Icons.update : Icons.save),
                label: Text(_esEdicion ? 'Actualizar Vuelo' : 'Registrar Vuelo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
