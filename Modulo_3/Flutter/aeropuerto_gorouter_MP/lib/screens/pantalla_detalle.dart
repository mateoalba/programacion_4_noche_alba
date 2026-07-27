import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/vuelo.dart';
import '../services/vuelos_service.dart';

String _capitalize(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1).replaceAll('_', ' ');
}

Color _colorEstado(String estado) {
  switch (estado) {
    case 'programado':
      return Colors.blue;
    case 'abordando':
      return Colors.orange;
    case 'en_vuelo':
      return Colors.green;
    case 'retrasado':
      return Colors.red;
    case 'cancelado':
      return Colors.grey;
    case 'aterrizado':
      return Colors.teal;
    default:
      return Colors.blueGrey;
  }
}

class PantallaDetalle extends StatefulWidget {
  final String id;
  const PantallaDetalle({super.key, required this.id});

  @override
  State<PantallaDetalle> createState() => _PantallaDetalleState();
}

class _PantallaDetalleState extends State<PantallaDetalle> {
  final VuelosService _vuelosService = VuelosService();
  Vuelo? _vuelo;
  bool _cargando = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _cargarVuelo();
  }

  Future<void> _cargarVuelo() async {
    setState(() {
      _cargando = true;
      _error = null;
    });
    try {
      final vuelo = await _vuelosService.getVuelo(widget.id);
      setState(() {
        _vuelo = vuelo;
        _cargando = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _cargando = false;
      });
    }
  }

  Future<void> _cambiarEstado(String nuevoEstado) async {
    try {
      final actualizado =
          await _vuelosService.cambiarEstado(widget.id, nuevoEstado);
      setState(() => _vuelo = actualizado);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Estado cambiado a $_capitalize(nuevoEstado)')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _eliminarVuelo() async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar vuelo'),
        content: Text(
            'Desea eliminar el vuelo ${_vuelo?.codigoVuelo ?? ''}? Esta accion no se puede deshacer.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
    if (confirmar == true) {
      try {
        await _vuelosService.eliminarVuelo(widget.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Vuelo eliminado')),
          );
          context.go('/vuelos');
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_vuelo != null ? 'Detalle: ${_vuelo!.codigoVuelo}' : 'Detalle'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          if (_vuelo != null)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              tooltip: 'Eliminar',
              onPressed: _eliminarVuelo,
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_cargando) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _cargarVuelo,
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }
    final v = _vuelo!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _colorEstado(v.estado).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(_capitalize(v.estado),
                  style: TextStyle(
                      fontSize: 16,
                      color: _colorEstado(v.estado),
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
          _Fila('Codigo', v.codigoVuelo),
          _Fila('Aerolinea', '${v.aerolineaCodigo} - ${v.aerolineaNombre}'),
          _Fila('Origen', '${v.origenCodigo} - ${v.origenNombre}'),
          _Fila('Destino', '${v.destinoCodigo} - ${v.destinoNombre}'),
          _Fila('Puerta', v.puertaCodigo),
          _Fila('Estado', _capitalize(v.estado)),
          _Fila('Salida', v.fechaSalida),
          _Fila('Llegada', v.fechaLlegada),
          _Fila('Pasajeros', '${v.pasajerosAbordados} / ${v.capacidad}'),
          _Fila('Internacional', v.internacional ? 'Si' : 'No'),
          const SizedBox(height: 24),
          const Text('Cambiar estado:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _EstadoChip('programado', v.estado, _cambiarEstado),
              _EstadoChip('en_vuelo', v.estado, _cambiarEstado),
              _EstadoChip('abordando', v.estado, _cambiarEstado),
              _EstadoChip('retrasado', v.estado, _cambiarEstado),
              _EstadoChip('cancelado', v.estado, _cambiarEstado),
              _EstadoChip('aterrizado', v.estado, _cambiarEstado),
            ],
          ),
          const SizedBox(height: 24),
          Row(children: [
            OutlinedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver'),
            ),
          ]),
        ],
      ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  const _Fila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 110,
          child: Text(label,
              style: TextStyle(
                  color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                  fontSize: 12)),
        ),
        Expanded(
            child: Text(valor, style: const TextStyle(fontSize: 15))),
      ]),
    );
  }
}

class _EstadoChip extends StatelessWidget {
  final String estado;
  final String actual;
  final Future<void> Function(String) onTap;
  const _EstadoChip(this.estado, this.actual, this.onTap);

  @override
  Widget build(BuildContext context) {
    final isSelected = estado == actual;
    return ActionChip(
      label: Text(_capitalize(estado)),
      avatar: Icon(
        isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
        size: 16,
      ),
      backgroundColor: isSelected
          ? _colorEstado(estado).withValues(alpha: 0.2)
          : null,
      onPressed: isSelected ? null : () => onTap(estado),
    );
  }
}
