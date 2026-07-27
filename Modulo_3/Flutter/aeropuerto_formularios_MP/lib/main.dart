import 'package:flutter/material.dart';
import 'models/vuelo.dart';
import 'widgets/formulario_vuelo.dart';
import 'screens/pantalla_vuelos.dart';
import 'screens/pantalla_busqueda.dart';
import 'screens/pantalla_gestor.dart';

void main() => runApp(const AeropuertoApp());

class AeropuertoApp extends StatelessWidget {
  const AeropuertoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Vuelos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _paso = 1;

  final _codigoCtrl = TextEditingController();
  final _focusCodigo = FocusNode();
  final _focusSiguiente = FocusNode();

  final List<Vuelo> _vuelos = [];

  @override
  void dispose() {
    _codigoCtrl.dispose();
    _focusCodigo.dispose();
    _focusSiguiente.dispose();
    super.dispose();
  }

  void _agregarVuelo(Vuelo v) {
    setState(() => _vuelos.add(v));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Vuelo ${v.codigoVuelo} registrado exitosamente')),
    );
  }

  void _eliminarVuelo(int index) {
    final vuelo = _vuelos[index];
    setState(() => _vuelos.removeAt(index));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Vuelo ${vuelo.codigoVuelo} eliminado')),
    );
  }

  String _tituloPaso() {
    switch (_paso) {
      case 1:
        return 'Paso 1: TextField y FocusNode';
      case 2:
        return 'Paso 2: Form y Validación';
      case 3:
        return 'Paso 3: Modelo y Lista';
      case 4:
        return 'Paso 4: Lista/Cuadrícula';
      case 5:
        return 'Paso 5: Búsqueda';
      default:
        return 'Control de Vuelos';
    }
  }

  Widget _construirPaso1() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'TextField + TextEditingController + FocusNode',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ingrese un código de vuelo. Use Tab para navegar entre campos.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _codigoCtrl,
            focusNode: _focusCodigo,
            decoration: const InputDecoration(
              labelText: 'Código de Vuelo',
              hintText: 'Ej: AV1234',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.flight),
            ),
            textInputAction: TextInputAction.next,
            onSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_focusSiguiente),
          ),
          const SizedBox(height: 16),
          TextField(
            focusNode: _focusSiguiente,
            decoration: const InputDecoration(
              labelText: 'Destino',
              hintText: 'Ingrese el destino',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Código ingresado:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ListenableBuilder(
                    listenable: _codigoCtrl,
                    builder: (ctx, _) => Text(
                      _codigoCtrl.text.isEmpty
                          ? '(vacío)'
                          : _codigoCtrl.text.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 24, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirPaso2() {
    return FormularioVuelo(onGuardar: _agregarVuelo);
  }

  Widget _construirPaso3() {
    return _vuelos.isEmpty
        ? const Center(child: Text('No hay vuelos'))
        : ListView.builder(
            itemCount: _vuelos.length,
            itemBuilder: (ctx, i) {
              final v = _vuelos[i];
              return ListTile(
                leading: Icon(Icons.flight,
                    color: v.internacional ? Colors.blue : Colors.teal),
                title: Text(
                    '${v.codigoVuelo} - ${v.aerolineaCodigo}'),
                subtitle: Text(
                    'Origen: ${v.origenCodigo} → Destino: ${v.destinoCodigo} | Puerta: ${v.puertaCodigo}'),
                trailing: Chip(
                  label: Text(v.estado,
                      style: const TextStyle(fontSize: 11)),
                ),
              );
            },
          );
  }

  Widget _construirPaso4() {
    return PantallaVuelos(
      vuelos: _vuelos,
      onEliminar: _eliminarVuelo,
    );
  }

  Widget _construirPaso5() {
    return PantallaBusqueda(vuelos: _vuelos);
  }

  Widget _cuerpoPaso() {
    switch (_paso) {
      case 1:
        return _construirPaso1();
      case 2:
        return _construirPaso2();
      case 3:
        return _construirPaso3();
      case 4:
        return _construirPaso4();
      case 5:
        return _construirPaso5();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloPaso()),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.flight, color: Colors.white, size: 40),
                  SizedBox(height: 8),
                  Text('Control de Vuelos',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            for (int i = 1; i <= 5; i++)
              ListTile(
                leading: Icon(
                  _paso == i ? Icons.flight_takeoff : Icons.flight,
                  color: _paso == i ? Colors.blue : null,
                ),
                title: Text('Paso $i',
                    style: TextStyle(
                        fontWeight: _paso == i
                            ? FontWeight.bold
                            : FontWeight.normal)),
                selected: _paso == i,
                onTap: () {
                  setState(() => _paso = i);
                  Navigator.pop(context);
                },
              ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Gestor Completo (API)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PantallaGestor()),
                );
              },
            ),
          ],
        ),
      ),
      body: _cuerpoPaso(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _paso - 1,
        onDestinationSelected: (i) => setState(() => _paso = i + 1),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.text_fields), label: 'Paso 1'),
          NavigationDestination(
              icon: Icon(Icons.app_registration), label: 'Paso 2'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Paso 3'),
          NavigationDestination(icon: Icon(Icons.grid_view), label: 'Paso 4'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Paso 5'),
        ],
      ),
    );
  }
}
