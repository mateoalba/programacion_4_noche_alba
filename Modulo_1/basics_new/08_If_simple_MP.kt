// Control de flujo - if simple
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("Control de flujo")
    println("if Simple")

    println("Ingrese los minutos de retraso del vuelo:")

    val retraso = readLine()?.toDoubleOrNull() ?: 0.0

    // =====================================
    // Condiciones
    // =====================================

    if (retraso >= 30) {
        println("Vuelo con retraso")
    }

    if (retraso >= 60) {
        println("Retraso crítico del vuelo")
    }

    // =====================================
    // Resultado final
    // =====================================

    println("Minutos de retraso registrados: $retraso")
}