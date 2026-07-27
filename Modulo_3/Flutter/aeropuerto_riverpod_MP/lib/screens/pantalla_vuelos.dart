import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vuelos_provider.dart';

class PantallaVuelos extends ConsumerStatefulWidget {
  const PantallaVuelos({super.key});

  @override
  ConsumerState<PantallaVuelos> createState() => _PantallaVuelosState();
}

class _PantallaVuelosState extends ConsumerState<PantallaVuelos> {
  final _searchController = TextEditingController();
  String _selectedEstado = '';

  final _estados = ['', 'programado', 'abordando', 'en_vuelo', 'retrasado', 'cancelado'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(vuelosProvider.notifier).fetchVuelos();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
        return Colors.red.shade300;
      case 'cancelado':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _iconoEstado(String estado) {
    switch (estado) {
      case 'programado':
        return Icons.schedule;
      case 'abordando':
        return Icons.person_add_alt_1;
      case 'en_vuelo':
        return Icons.flight;
      case 'retrasado':
        return Icons.warning_amber;
      case 'cancelado':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  void _buscar() {
    ref.read(vuelosProvider.notifier).fetchVuelos(
      search: _searchController.text,
      estado: _selectedEstado,
    );
  }

  void _mostrarDialogoAgregar() {
    final controllers = <String, TextEditingController>{
      'codigo_vuelo': TextEditingController(),
      'aerolinea_codigo': TextEditingController(),
      'aerolinea_nombre': TextEditingController(),
      'origen_codigo': TextEditingController(),
      'origen_nombre': TextEditingController(),
      'destino_codigo': TextEditingController(),
      'destino_nombre': TextEditingController(),
      'puerta_codigo': TextEditingController(),
      'capacidad': TextEditingController(text: '180'),
      'pasajeros_abordados': TextEditingController(text: '0'),
      'fecha_salida': TextEditingController(),
      'fecha_llegada': TextEditingController(),
    };
    bool internacional = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Nuevo Vuelo'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: controllers['codigo_vuelo'], decoration: const InputDecoration(labelText: 'Código Vuelo (ej: AV1234)')),
                TextField(controller: controllers['aerolinea_codigo'], decoration: const InputDecoration(labelText: 'Código Aerolínea')),
                TextField(controller: controllers['aerolinea_nombre'], decoration: const InputDecoration(labelText: 'Nombre Aerolínea')),
                TextField(controller: controllers['origen_codigo'], decoration: const InputDecoration(labelText: 'Código Origen')),
                TextField(controller: controllers['origen_nombre'], decoration: const InputDecoration(labelText: 'Nombre Origen')),
                TextField(controller: controllers['destino_codigo'], decoration: const InputDecoration(labelText: 'Código Destino')),
                TextField(controller: controllers['destino_nombre'], decoration: const InputDecoration(labelText: 'Nombre Destino')),
                TextField(controller: controllers['puerta_codigo'], decoration: const InputDecoration(labelText: 'Puerta')),
                TextField(controller: controllers['capacidad'], decoration: const InputDecoration(labelText: 'Capacidad'), keyboardType: TextInputType.number),
                TextField(controller: controllers['pasajeros_abordados'], decoration: const InputDecoration(labelText: 'Pasajeros'), keyboardType: TextInputType.number),
                TextField(controller: controllers['fecha_salida'], decoration: const InputDecoration(labelText: 'Fecha Salida (YYYY-MM-DDTHH:MM:SSZ)')),
                TextField(controller: controllers['fecha_llegada'], decoration: const InputDecoration(labelText: 'Fecha Llegada (YYYY-MM-DDTHH:MM:SSZ)')),
                SwitchListTile(
                  title: const Text('Internacional'),
                  value: internacional,
                  onChanged: (v) => setDialogState(() => internacional = v),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
            FilledButton(
              onPressed: () {
                final data = {
                  'codigo_vuelo': controllers['codigo_vuelo']!.text,
                  'aerolinea_codigo': controllers['aerolinea_codigo']!.text,
                  'aerolinea_nombre': controllers['aerolinea_nombre']!.text,
                  'origen_codigo': controllers['origen_codigo']!.text,
                  'origen_nombre': controllers['origen_nombre']!.text,
                  'destino_codigo': controllers['destino_codigo']!.text,
                  'destino_nombre': controllers['destino_nombre']!.text,
                  'puerta_codigo': controllers['puerta_codigo']!.text,
                  'estado': 'programado',
                  'capacidad': int.tryParse(controllers['capacidad']!.text) ?? 180,
                  'pasajeros_abordados': int.tryParse(controllers['pasajeros_abordados']!.text) ?? 0,
                  'internacional': internacional,
                  if (controllers['fecha_salida']!.text.isNotEmpty) 'fecha_salida': controllers['fecha_salida']!.text,
                  if (controllers['fecha_llegada']!.text.isNotEmpty) 'fecha_llegada': controllers['fecha_llegada']!.text,
                };
                ref.read(vuelosProvider.notifier).agregar(data);
                Navigator.pop(context);
              },
              child: const Text('Crear'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vuelosAsync = ref.watch(vuelosProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vuelos'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authServiceProvider).logout();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar vuelo...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    onSubmitted: (_) => _buscar(),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedEstado,
                  items: _estados.map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.isEmpty ? 'Todos' : e),
                  )).toList(),
                  onChanged: (v) {
                    setState(() => _selectedEstado = v ?? '');
                    _buscar();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _buscar,
                ),
              ],
            ),
          ),
          Expanded(
            child: vuelosAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 8),
                    Text('Error: $e'),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _buscar,
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
              data: (vuelos) => RefreshIndicator(
                onRefresh: () => ref.read(vuelosProvider.notifier).fetchVuelos(
                  search: _searchController.text,
                  estado: _selectedEstado,
                ),
                child: vuelos.isEmpty
                    ? ListView(
                        children: const [
                          SizedBox(height: 100),
                          Center(child: Text('Sin vuelos registrados')),
                        ],
                      )
                    : ListView.separated(
                        itemCount: vuelos.length,
                        separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
                        itemBuilder: (context, i) {
                          final v = vuelos[i];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _colorEstado(v.estado).withValues(alpha: 0.15),
                              child: Icon(_iconoEstado(v.estado), color: _colorEstado(v.estado)),
                            ),
                            title: Text('${v.codigoVuelo} - ${v.aerolineaNombre}',
                                style: const TextStyle(fontWeight: FontWeight.w600)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${v.origenCodigo} → ${v.destinoCodigo}  |  Puerta: ${v.puertaCodigo}'),
                                Row(
                                  children: [
                                    Icon(_iconoEstado(v.estado), size: 14, color: _colorEstado(v.estado)),
                                    const SizedBox(width: 4),
                                    Text(v.estado, style: TextStyle(color: _colorEstado(v.estado), fontWeight: FontWeight.w500)),
                                    const SizedBox(width: 12),
                                    const Icon(Icons.people, size: 14, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text('${v.pasajerosAbordados}/${v.capacidad} pax'),
                                    if (v.internacional) ...[
                                      const SizedBox(width: 8),
                                      const Icon(Icons.public, size: 14, color: Colors.blue),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    v.favorito ? Icons.star : Icons.star_border,
                                    color: v.favorito ? Colors.amber : null,
                                  ),
                                  onPressed: () => ref.read(vuelosProvider.notifier).toggleFavorito(v.id),
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (value) async {
                                    if (value == 'eliminar') {
                                      await ref.read(vuelosProvider.notifier).eliminar(v.id);
                                    } else {
                                      await ref.read(vuelosServiceProvider).cambiarEstado(v.id, value);
                                      ref.read(vuelosProvider.notifier).fetchVuelos(
                                        search: _searchController.text,
                                        estado: _selectedEstado,
                                      );
                                    }
                                  },
                                  itemBuilder: (_) => [
                                    const PopupMenuItem(value: 'programado', child: Text('Programado')),
                                    const PopupMenuItem(value: 'abordando', child: Text('Abordando')),
                                    const PopupMenuItem(value: 'en_vuelo', child: Text('En vuelo')),
                                    const PopupMenuItem(value: 'retrasado', child: Text('Retrasado')),
                                    const PopupMenuItem(value: 'cancelado', child: Text('Cancelado')),
                                    const PopupMenuDivider(),
                                    const PopupMenuItem(value: 'eliminar', child: Text('Eliminar', style: TextStyle(color: Colors.red))),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregar,
        child: const Icon(Icons.add),
      ),
    );
  }
}
