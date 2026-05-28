// Función sin parámetros y sin retorno
void saludar() {
  print('Hola mundo');
}

// Función con parámetros y sin retorno
void saludoConParametro(String nombre) {
  print('Hola $nombre');
}

// Función sin parámetros y con retorno
int obtenerNumero() {
  return 10;
}

//funcion con parametros y con retorno
int sumar(int a, int b) {
  return a + b;
}
//funcion flecha arrow function
int multiplicar(int a, int b) => a * b;

//funcion con parametros opcionales
void saludarOpcional(String nombre, [String? apellido]) {
  if (apellido != null) {
    print('Hola $nombre $apellido');
  } else {
    print('Hola $nombre');
  }
}

//funcion con parametros opcionales nombrados
void saludarOpcionalNamed(String nombre, {String? apellido}) {
  if (apellido != null) {
    print('Hola $nombre $apellido');
  } else {
    print('Hola $nombre');
  }
}

void main() {
  saludar();
  saludoConParametro('Pedro Perez');
  int numero = obtenerNumero();
  print(numero);
  print('el numero es: ${obtenerNumero()}');
  print('la suma es: ${sumar(5, 3)}');
  print('la multiplicacion es: ${multiplicar(5, 3)}');
  saludarOpcional('Juan');
  saludarOpcional('Juan', 'Pérez');
  saludarOpcionalNamed('Juan');
  saludarOpcionalNamed('Juan', apellido: 'Pérez');
}