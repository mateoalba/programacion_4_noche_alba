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

void main() {
  saludar();
  saludoConParametro('Pedro Perez');

  int numero = obtenerNumero();
  print(numero);
}