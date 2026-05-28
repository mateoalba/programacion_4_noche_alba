// Inputs en Kotlin
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("Sistema de Control de Vuelos")

    // =========================
    // Ingreso del nombre del agente
    // =========================

    println("Ingrese el nombre del agente aeroportuario:")

    val agente = readLine()

    println("Bienvenido $agente")

    // =========================
    // Ingreso de vuelos atendidos
    // =========================

    println("Ingrese la cantidad de vuelos atendidos:")

    val vuelos = readLine()?.toIntOrNull() ?: 0

    println("Vuelos atendidos: $vuelos")

    // =========================
    // Operaciones
    // =========================

    val vuelosDobles = vuelos * 2

    println("El doble de vuelos atendidos es: $vuelosDobles")

    println(
        "Si se incrementan los vuelos, el total sería: ${vuelos * 2}"
    )
}