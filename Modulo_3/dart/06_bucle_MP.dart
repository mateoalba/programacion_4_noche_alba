void main() {

  // =========================================
  // CICLOS FOR - CONTROL DE VUELOS
  // =========================================

  // for con índice
  for (int i = 0; i < 5; i++) {

    print('Vuelo procesado #$i');
  }

  // for con paso distinto
  for (int i = 0; i <= 100; i += 25) {

    print('Porcentaje de abordaje: $i%');
  }

  // for decreciente
  for (int i = 5; i >= 1; i--) {

    print('Cuenta regresiva para despegue: $i');
  }

  // =========================================
  // FOR-IN
  // =========================================

  final vuelos = [

    'AV203',
    'IB450',
    'LA500',
    'CM300',
    'AA700'
  ];

  // Recorrer lista
  for (final vuelo in vuelos) {

    print(vuelo);
  }

  // forEach con lambda
  vuelos.forEach(

    (v) => print(v.toLowerCase())
  );

  // =========================================
  // FOR-IN SOBRE MAP
  // =========================================

  final puertas = {

    'AV203': 12,
    'IB450': 8,
    'LA500': 5,
    'CM300': 3
  };

  for (final entrada in puertas.entries) {

    print(
      '${entrada.key} '
      '→ puerta ${entrada.value}'
    );
  }

  /*
  // Recorrer caracteres de un String
  for (final caracter in 'AV203'.split('')) {

    print(caracter);
  }
  */
}