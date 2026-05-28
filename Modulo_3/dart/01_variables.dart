void main() {
  // var — tipo inferido
  var nombre = 'Ana';
  var edad = 28;
  var precio = 89.99;
  var activo = true;

  // Tipo explícito
  String apellido = 'García';
  int stock = 100;
  double pi = 3.14159;
  bool visible = false;

  // final
  final ciudad = 'Madrid';

  // const
  const gravedad = 9.8;
  const pi2 = 3.14159;

  // final vs const
  final ahora = DateTime.now();

  print('$nombre $apellido tiene $edad años en $ciudad');

  // ==============================
  // Mutabilidad
  // ==============================

  var contador = 0;
  contador = 1;

  print('Contador: $contador');

  final lista = [1, 2, 3];
  lista.add(4);

  print('Lista final: $lista');

  const colores = ['rojo', 'azul'];

  // ==============================
  // Null Safety
  // ==============================

  String nombre2 = 'Ana';

  String? apellido2 = null;
  apellido2 = 'García';

  String? ciudad2;

  // Safe call
  print(ciudad2?.length);

  // Operador ??
  String resultado = ciudad2 ?? 'Sin ciudad';
  print(resultado);

  // Antes de usar !
  ciudad2 = 'Quito';

  String ciudadSegura = ciudad2!;
  print(ciudadSegura);

  // Null check
  if (apellido2 != null) {
    print(apellido2.length);
  }

  // late
  late String token;
  token = 'abc123';

  print(token);

  // ==============================
  // Variables usadas para evitar warnings
  // ==============================

  print(precio);
  print(activo);
  print(stock);
  print(pi);
  print(visible);
  print(gravedad);
  print(pi2);
  print(ahora);
  print(nombre2);
}