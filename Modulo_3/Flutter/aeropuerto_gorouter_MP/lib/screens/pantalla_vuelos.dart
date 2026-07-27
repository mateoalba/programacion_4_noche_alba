import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/vuelo.dart';
import '../services/vuelos_service.dart';
import '../providers/auth_provider.dart';

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

String _capitalize(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1).replaceAll('_', ' ');
}

class PantallaVuelos extends ConsumerStatefulWidget {
  const PantallaVuelos({super.key});

  @override
  ConsumerState<PantallaVuelos> createState() => _PantallaVuelosState();
}

class _PantallaVuelosState extends ConsumerState<PantallaVuelos> {
  final VuelosService _vuelosService = VuelosService();
  List<Vuelo> _vuelos = [];
  bool _cargando = true;
  String? _error;
  String _filtroEstado = '';
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarVuelos();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _cargarVuelos() async {
    setState(() {
      _cargando = true;
      _error = null;
    });
    try {
      final result = await _vuelosService.getVuelos(
        search: _searchCtrl.text.isNotEmpty ? _searchCtrl.text : null,
        estado: _filtroEstado.isNotEmpty ? _filtroEstado : null,
      );
      setState(() {
        _vuelos = result['results'] as List<Vuelo>;
        _cargando = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final usuario = auth is Autenticado ? auth.usuario : '';
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Vuelos',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Torre: $usuario',
                style: const TextStyle(fontSize: 12)),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      hintText: 'Buscar vuelo...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      suffixIcon: _searchCtrl.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, size: 18),
                              onPressed: () {
                                _searchCtrl.clear();
                                _cargarVuelos();
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.9),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      isDense: true,
                    ),
                    onSubmitted: (_) => _cargarVuelos(),
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  icon: Badge(
                    isLabelVisible: _filtroEstado.isNotEmpty,
                    child: const Icon(Icons.filter_list),
                  ),
                  onSelected: (v) {
                    setState(() => _filtroEstado = v == _filtroEstado ? '' : v);
                    _cargarVuelos();
                  },
                  itemBuilder: (_) => [
                    _buildFilterItem('programado', 'Programado'),
                    _buildFilterItem('en_vuelo', 'En vuelo'),
                    _buildFilterItem('abordando', 'Abordando'),
                    _buildFilterItem('retrasado', 'Retrasado'),
                    _buildFilterItem('cancelado', 'Cancelado'),
                    _buildFilterItem('aterrizado', 'Aterrizado'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/agregar'),
        child: const Icon(Icons.add),
      ),
      body: _buildBody(),
    );
  }

  PopupMenuItem<String> _buildFilterItem(String value, String label) {
    final selected = _filtroEstado == value;
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          if (selected)
            Icon(Icons.check, size: 18, color: _colorEstado(value))
          else
            const SizedBox(width: 18),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
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
              onPressed: _cargarVuelos,
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }
    if (_vuelos.isEmpty) {
      return const Center(child: Text('No hay vuelos para mostrar'));
    }
    return RefreshIndicator(
      onRefresh: _cargarVuelos,
      child: ListView.separated(
        itemCount: _vuelos.length,
        separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, i) {
          final v = _vuelos[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: _colorEstado(v.estado).withValues(alpha: 0.15),
              child: Icon(Icons.flight, color: _colorEstado(v.estado)),
            ),
            title: Text('${v.codigoVuelo} - ${v.aerolineaNombre}',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(
                '${v.origenCodigo} → ${v.destinoCodigo} | Puerta ${v.puertaCodigo}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _colorEstado(v.estado).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(_capitalize(v.estado),
                      style: TextStyle(
                          fontSize: 11,
                          color: _colorEstado(v.estado),
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right),
              ],
            ),
            onTap: () => context.push('/vuelos/${v.id}'),
          );
        },
      ),
    );
  }
}
