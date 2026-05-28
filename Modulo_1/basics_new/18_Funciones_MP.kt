fun main() {

    saludar()

    saludarConParametros("Vuelo UIO-452")

    val pasajeros = 120
    val capacidad = 180

    println(
        "Pasajeros registrados: $pasajeros / $capacidad = ${
            calcularDisponibles(capacidad, pasajeros)
        } asientos disponibles"
    )

    println(
        "Retraso total: ${
            calcularRetraso(15, 20)
        } minutos"
    )

    operacion()

    println(
        "Equipaje total: ${
            calcularEquipaje(120, 2)
        } maletas"
    )
}

// =========================================
// Función simple
// =========================================
fun saludar() {
    println("✈️ Sistema de control aeroportuario iniciado")
}

// =========================================
// Función con parámetros
// =========================================
fun saludarConParametros(vuelo: String) {
    println("🛫 Bienvenido al control del $vuelo")
}

// =========================================
// Función con retorno
// =========================================
fun calcularDisponibles(
    capacidad: Int,
    pasajeros: Int
): Int {

    return capacidad - pasajeros
}

// =========================================
// Función simplificada
// =========================================
fun calcularRetraso(
    retraso1: Int,
    retraso2: Int
) = retraso1 + retraso2

// =========================================
// Función dentro de función
// =========================================
fun operacion() {

    fun combustibleExtra(vuelos: Int) = vuelos * 500

    println(
        "⛽ Combustible adicional requerido: ${
            combustibleExtra(3)
        } litros"
    )
}

// =========================================
// Funciones como variables
// =========================================
val calcularEquipaje = { pasajeros: Int, maletas: Int ->
    pasajeros * maletas
}