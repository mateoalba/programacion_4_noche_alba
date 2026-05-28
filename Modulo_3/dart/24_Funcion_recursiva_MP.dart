// =========================================
// RECURSIVIDAD - CONTROL DE VUELOS
// =========================================

// Calcular vuelos acumulados
// usando recursividad

int totalVuelos(int n) {

  // Caso base
  if (n <= 1) return 1;

  // Llamada recursiva
  return n + totalVuelos(n - 1);
}

// Simulación de crecimiento
// de pasajeros

int pasajerosAcumulados(int n) {

  if (n <= 1) return n;

  return
      pasajerosAcumulados(n - 1) +
      pasajerosAcumulados(n - 2);
}

// Contar vuelos en terminales
// del aeropuerto

int contarVuelos(
    Map<String, dynamic> terminal
) {

  int total = 0;

  for (final entrada in terminal.entries) {

    if (entrada.value is Map) {

      // Subterminal
      total += contarVuelos(
        entrada.value
            as Map<String, dynamic>
      );

    } else {

      // Vuelo registrado
      total++;
    }
  }

  return total;
}

void main() {

  print(
    totalVuelos(6)
  );

  // Resultado:
  // 21

  print(
    pasajerosAcumulados(10)
  );

  // Resultado:
  // 55

  final aeropuerto = {

    'Terminal_A': {

      'Nacional': {

        'AV203': true,

        'LA500': true,
      },

      'Internacional': {

        'IB450': true,
      },
    },

    'Terminal_B': {

      'Carga': {

        'CM300': true,

        'AA700': true,
      }
    },

    'torre_control': true,

    'radar_principal': true,
  };

  print(

    'Total de vuelos registrados: '
    '${contarVuelos(aeropuerto)}'
  );

  // Resultado:
  // 7
}