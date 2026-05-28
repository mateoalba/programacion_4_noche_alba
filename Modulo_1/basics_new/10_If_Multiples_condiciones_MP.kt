// If con múltiples condiciones
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("If con múltiples condiciones")

    println("Ingrese los minutos de retraso del vuelo:")

    val retraso = readLine()?.toIntOrNull() ?: 0

    // =====================================
    // Clasificación del vuelo
    // =====================================

    val clasificacion = if (retraso <= 15) {

        "Vuelo puntual"

    } else if (retraso <= 30) {

        "Retraso leve"

    } else if (retraso <= 60) {

        "Retraso moderado"

    } else if (retraso <= 120) {

        "Retraso crítico"

    } else {

        "Vuelo cancelado"
    }

    // =====================================
    // Resultado
    // =====================================

    println("Clasificación del vuelo: $clasificacion")
}