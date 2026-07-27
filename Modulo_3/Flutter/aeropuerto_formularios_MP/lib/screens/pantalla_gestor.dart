import 'package:flutter/material.dart';
import '../models/vuelo.dart';
import '../services/api_service.dart';
import '../widgets/formulario_vuelo.dart';
import '../widgets/fila_vuelo.dart';
import '../widgets/tarjeta_vuelo_grid.dart';

class PantallaGestor extends StatefulWidget {
  const PantallaGestor({super.key});

  @override
  State<PantallaGestor> createState() => _PantallaGestorState();
}

class _PantallaGestorState extends State<PantallaGestor> {
  final ApiService _api = ApiService();
  final List<Vuelo> _vuelos = [];
  String _consulta = '';
  bool _esGrid = false;
  bool _mostrarFormulario = false;
  bool _cargando = false;
  String? _error;

  Vuelo? _vueloEditando;

  @override
  void initState() {
    super.initState();
    if (!_api.autenticado) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _mostrarLogin());
    } else {
      _cargarVuelos();
    }
  }

  Future<void> _mostrarLogin() async {
    final usernameCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Iniciar Sesión'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('SkyOps API - Ingrese sus credenciales'),
              const SizedBox(height: 16),
              TextFormField(
                controller: usernameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Ingrese usuario' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Ingrese contraseña' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(ctx, true);
              }
            },
            child: const Text('Ingresar'),
          ),
        ],
      ),
    );

    if (result == true) {
      setState(() => _cargando = true);
      final ok = await _api.login(
        usernameCtrl.text.trim(),
        passwordCtrl.text,
      );
      if (ok) {
        _cargarVuelos();
      } else {
        setState(() => _cargando = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Credenciales incorrectas'),
              backgroundColor: Colors.red,
            ),
          );
          _mostrarLogin();
        }
      }
    }
  }

  Future<void> _cargarVuelos() async {
    setState(() {
      _cargando = true;
      _error = null;
    });

    try {
      final vuelos = await _api.getVuelos();
      setState(() {
        _vuelos.clear();
        _vuelos.addAll(vuelos);
        _cargando = false;
      });
    } catch (e) {
      setState(() {
        _cargando = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _agregarVuelo(Vuelo v) async {
    try {
      setState(() => _cargando = true);
      final creado = await _api.crearVuelo(v);
      setState(() {
        _vuelos.add(creado);
        _mostrarFormulario = false;
        _cargando = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Vuelo ${creado.codigoVuelo} registrado')),
        );
      }
    } catch (e) {
      setState(() => _cargando = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _actualizarVuelo(Vuelo v) async {
    try {
      setState(() => _cargando = true);
      final actualizado = await _api.actualizarVuelo(v.id, v);
      setState(() {
        final idx = _vuelos.indexWhere((x) => x.id == v.id);
        if (idx >= 0) _vuelos[idx] = actualizado;
        _vueloEditando = null;
        _mostrarFormulario = false;
        _cargando = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Vuelo ${actualizado.codigoVuelo} actualizado')),
        );
      }
    } catch (e) {
      setState(() => _cargando = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _eliminarVuelo(Vuelo vuelo) async {
    try {
      setState(() => _cargando = true);
      await _api.eliminarVuelo(vuelo.id);
      setState(() {
        _vuelos.removeWhere((v) => v.id == vuelo.id);
        _cargando = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Vuelo ${vuelo.codigoVuelo} eliminado')),
        );
      }
    } catch (e) {
      setState(() => _cargando = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _iniciarEdicion(Vuelo vuelo) {
    setState(() {
      _vueloEditando = vuelo;
      _mostrarFormulario = true;
    });
  }

  void _cancelarEdicion() {
    setState(() {
      _vueloEditando = null;
      _mostrarFormulario = false;
    });
  }

  void _onGuardarFormulario(Vuelo v) {
    if (_vueloEditando != null) {
      _actualizarVuelo(v);
    } else {
      _agregarVuelo(v);
    }
  }

  List<Vuelo> get _vuelosFiltrados {
    if (_consulta.isEmpty) return _vuelos;
    final q = _consulta.toLowerCase();
    return _vuelos.where((v) {
      return v.codigoVuelo.toLowerCase().contains(q) ||
          v.aerolineaCodigo.toLowerCase().contains(q) ||
          v.aerolineaNombre.toLowerCase().contains(q) ||
          v.origenCodigo.toLowerCase().contains(q) ||
          v.destinoCodigo.toLowerCase().contains(q);
    }).toList();
  }

  void _cerrarSesion() {
    _api.logout();
    setState(() {
      _vuelos.clear();
      _consulta = '';
    });
    _mostrarLogin();
  }

  @override
  Widget build(BuildContext context) {
    final filtrados = _vuelosFiltrados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de Vuelos - SkyOps'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          if (_api.autenticado)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Center(
                child: Text(
                  _api.usuario?['username'] ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          if (_api.autenticado)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _cargarVuelos,
              tooltip: 'Recargar',
            ),
          if (_api.autenticado)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _cerrarSesion,
              tooltip: 'Cerrar sesión',
            ),
        ],
      ),
      body: !_api.autenticado
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock_outline,
                      size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No autenticado',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: _mostrarLogin,
                    icon: const Icon(Icons.login),
                    label: const Text('Iniciar Sesión'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Buscar vuelo',
                      hintText: 'Código, aerolínea, origen o destino...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.flight),
                    ),
                    onChanged: (v) => setState(() => _consulta = v),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        '${filtrados.length} vuelo(s)',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(_esGrid ? Icons.list : Icons.grid_view),
                        onPressed: () =>
                            setState(() => _esGrid = !_esGrid),
                        tooltip: _esGrid ? 'Vista lista' : 'Vista cuadrícula',
                      ),
                      IconButton(
                        icon: Icon(_mostrarFormulario
                            ? Icons.expand_less
                            : Icons.expand_more),
                        onPressed: () => setState(() {
                          if (_mostrarFormulario) {
                            _cancelarEdicion();
                          } else {
                            _mostrarFormulario = true;
                          }
                        }),
                        tooltip: _mostrarFormulario
                            ? 'Ocultar formulario'
                            : 'Registrar vuelo',
                      ),
                    ],
                  ),
                ),
                if (_cargando)
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: LinearProgressIndicator(),
                  ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Card(
                      color: Colors.red.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline,
                                color: Colors.red),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(_error!,
                                  style: const TextStyle(color: Colors.red)),
                            ),
                            TextButton(
                              onPressed: _cargarVuelos,
                              child: const Text('Reintentar'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (_mostrarFormulario)
                  FormularioVuelo(
                    onGuardar: _onGuardarFormulario,
                    vuelo: _vueloEditando,
                  ),
                Expanded(
                  child: filtrados.isEmpty && !_cargando
                      ? const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.flight_takeoff,
                                  size: 64, color: Colors.grey),
                              SizedBox(height: 12),
                              Text('No se encontraron vuelos',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        )
                      : _esGrid
                          ? GridView.builder(
                              padding: const EdgeInsets.all(8),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.9,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: filtrados.length,
                              itemBuilder: (ctx, i) => TarjetaVueloGrid(
                                vuelo: filtrados[i],
                                onEliminar: () =>
                                    _eliminarVuelo(filtrados[i]),
                                onEditar: () =>
                                    _iniciarEdicion(filtrados[i]),
                              ),
                            )
                          : ListView.separated(
                              itemCount: filtrados.length,
                              separatorBuilder: (ctx, i) =>
                                  const Divider(height: 1),
                              itemBuilder: (ctx, i) => FilaVuelo(
                                vuelo: filtrados[i],
                                onEliminar: () =>
                                    _eliminarVuelo(filtrados[i]),
                                onEditar: () =>
                                    _iniciarEdicion(filtrados[i]),
                              ),
                            ),
                ),
              ],
            ),
    );
  }
}
