import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/vuelos_service.dart';

class PantallaAgregar extends StatefulWidget {
  const PantallaAgregar({super.key});

  @override
  State<PantallaAgregar> createState() => _PantallaAgregarState();
}

class _PantallaAgregarState extends State<PantallaAgregar> {
  final _formKey = GlobalKey<FormState>();
  final VuelosService _vuelosService = VuelosService();
  bool _guardando = false;

  final _codigoVueloCtrl = TextEditingController();
  final _aerolineaCodCtrl = TextEditingController();
  final _aerolineaNomCtrl = TextEditingController();
  final _origenCodCtrl = TextEditingController();
  final _origenNomCtrl = TextEditingController();
  final _destinoCodCtrl = TextEditingController();
  final _destinoNomCtrl = TextEditingController();
  final _puertaCtrl = TextEditingController();
  final _capacidadCtrl = TextEditingController();

  DateTime _fechaSalida = DateTime.now();
  DateTime _fechaLlegada = DateTime.now().add(const Duration(hours: 2));
  String _estado = 'programado';
  bool _internacional = false;

  @override
  void dispose() {
    _codigoVueloCtrl.dispose();
    _aerolineaCodCtrl.dispose();
    _aerolineaNomCtrl.dispose();
    _origenCodCtrl.dispose();
    _origenNomCtrl.dispose();
    _destinoCodCtrl.dispose();
    _destinoNomCtrl.dispose();
    _puertaCtrl.dispose();
    _capacidadCtrl.dispose();
    super.dispose();
  }

  Future<void> _seleccionarFecha(bool esSalida) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: esSalida ? _fechaSalida : _fechaLlegada,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
            esSalida ? _fechaSalida : _fechaLlegada),
      );
      if (time != null) {
        final fecha = DateTime(
            picked.year, picked.month, picked.day, time.hour, time.minute);
        setState(() {
          if (esSalida) {
            _fechaSalida = fecha;
          } else {
            _fechaLlegada = fecha;
          }
        });
      }
    }
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _guardando = true);
    try {
      final data = {
        'codigo_vuelo': _codigoVueloCtrl.text,
        'aerolinea_codigo': _aerolineaCodCtrl.text,
        'aerolinea_nombre': _aerolineaNomCtrl.text,
        'origen_codigo': _origenCodCtrl.text,
        'origen_nombre': _origenNomCtrl.text,
        'destino_codigo': _destinoCodCtrl.text,
        'destino_nombre': _destinoNomCtrl.text,
        'puerta_codigo': _puertaCtrl.text,
        'estado': _estado,
        'fecha_salida': _fechaSalida.toUtc().toIso8601String(),
        'fecha_llegada': _fechaLlegada.toUtc().toIso8601String(),
        'pasajeros_abordados': 0,
        'capacidad': int.tryParse(_capacidadCtrl.text) ?? 0,
        'internacional': _internacional,
      };
      await _vuelosService.crearVuelo(data);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vuelo creado exitosamente')),
        );
        context.go('/vuelos');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _guardando = false);
    }
  }

  String _formatFecha(DateTime f) {
    return '${f.day.toString().padLeft(2, '0')}/${f.month.toString().padLeft(2, '0')}/${f.year} ${f.hour.toString().padLeft(2, '0')}:${f.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Vuelo'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Informacion del vuelo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _codigoVueloCtrl,
                decoration: const InputDecoration(
                  labelText: 'Codigo de vuelo',
                  hintText: 'Ej: AV1234',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Requerido' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _aerolineaCodCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Codigo aerolinea',
                        hintText: 'Ej: AV',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _aerolineaNomCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Nombre aerolinea',
                        hintText: 'Ej: Avianca',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _origenCodCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Codigo origen',
                        hintText: 'Ej: UIO',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _origenNomCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Nombre origen',
                        hintText: 'Ej: Mariscal Sucre',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _destinoCodCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Codigo destino',
                        hintText: 'Ej: GYE',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _destinoNomCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Nombre destino',
                        hintText: 'Ej: Jose Joaquin de Olmedo',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _puertaCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Puerta',
                        hintText: 'Ej: A12',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _capacidadCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Capacidad',
                        hintText: 'Ej: 180',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Requerido' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Fechas',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _seleccionarFecha(true),
                      icon: const Icon(Icons.calendar_today, size: 18),
                      label: Text('Salida: ${_formatFecha(_fechaSalida)}'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _seleccionarFecha(false),
                      icon: const Icon(Icons.calendar_today, size: 18),
                      label: Text('Llegada: ${_formatFecha(_fechaLlegada)}'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Internacional:'),
                  Switch(
                    value: _internacional,
                    onChanged: (v) => setState(() => _internacional = v),
                  ),
                  const Spacer(),
                  const Text('Estado:'),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _estado,
                    items: const [
                      DropdownMenuItem(
                          value: 'programado', child: Text('Programado')),
                      DropdownMenuItem(
                          value: 'en_vuelo', child: Text('En vuelo')),
                      DropdownMenuItem(
                          value: 'abordando', child: Text('Abordando')),
                      DropdownMenuItem(
                          value: 'retrasado', child: Text('Retrasado')),
                      DropdownMenuItem(
                          value: 'cancelado', child: Text('Cancelado')),
                      DropdownMenuItem(
                          value: 'aterrizado', child: Text('Aterrizado')),
                    ],
                    onChanged: (v) =>
                        setState(() => _estado = v ?? 'programado'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _guardando ? null : _guardar,
                icon: _guardando
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                label: const Text('Guardar vuelo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
