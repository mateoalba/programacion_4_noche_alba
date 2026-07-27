import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/vuelo.dart';
import '../services/vuelos_service.dart';

class PantallaVuelosFiltro extends StatefulWidget {
  final bool soloInternacionales;
  const PantallaVuelosFiltro({super.key, this.soloInternacionales = false});

  @override
  State<PantallaVuelosFiltro> createState() => _PantallaVuelosFiltroState();
}

class _PantallaVuelosFiltroState extends State<PantallaVuelosFiltro> {
  final VuelosService _vuelosService = VuelosService();
  List<Vuelo> _vuelos = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    try {
      final result = await _vuelosService.getVuelos();
      final todos = result['results'] as List<Vuelo>;
      setState(() {
        _vuelos = widget.soloInternacionales
            ? todos.where((v) => v.internacional).toList()
            : todos;
        _cargando = false;
      });
    } catch (_) {
      setState(() => _cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Vuelos${widget.soloInternacionales ? ' (Internacionales)' : ''}'),
        actions: [
          IconButton(
            icon: Icon(
                widget.soloInternacionales ? Icons.public : Icons.flight),
            tooltip:
                widget.soloInternacionales ? 'Ver todos' : 'Solo internacionales',
            onPressed: () => widget.soloInternacionales
                ? context.go('/vuelos')
                : context.go('/vuelos?internacional=true'),
          ),
        ],
      ),
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _vuelos.length,
              itemBuilder: (context, i) {
                final v = _vuelos[i];
                return ListTile(
                  leading: Icon(Icons.flight,
                      color: v.internacional ? Colors.blue : Colors.grey),
                  title: Text('${v.codigoVuelo} - ${v.aerolineaNombre}'),
                  subtitle: Text(
                      '${v.origenCodigo} → ${v.destinoCodigo} | ${v.estado}'),
                  onTap: () => context.push('/vuelos/${v.id}'),
                );
              },
            ),
    );
  }
}
