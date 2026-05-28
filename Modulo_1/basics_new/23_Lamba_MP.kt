fun main() {

    println("Funciones Lambda - Sistema de vuelos")

    // =========================================
    // Lambda con tipos explícitos
    // =========================================
    val sumarPasajeros: (Int, Int) -> Int =
        { vuelo1: Int, vuelo2: Int -> vuelo1 + vuelo2 }

    println(
        "Total pasajeros: ${
            sumarPasajeros(120, 80)
        }"
    )

    // =========================================
    // Tipos inferidos
    // =========================================
    val calcularRetraso: (Int, Int) -> Int =
        { retraso1, retraso2 -> retraso1 + retraso2 }

    println(
        "Retraso acumulado: ${
            calcularRetraso(15, 20)
        } minutos"
    )

    // =========================================
    // Parámetro implícito it
    // =========================================
    val duplicarEquipaje: (Int) -> Int =
        { it * 2 }

    println(
        "Equipaje total: ${
            duplicarEquipaje(35)
        } maletas"
    )
}