// Operadores lógicos
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("Operadores Lógicos - Aeropuerto")

    val pistaDisponible = true
    val pilotoAutorizado = false
    val vueloActivo = true
    val climaFavorable = false

    // =========================
    // Operador AND &&
    // =========================

    println("Operador AND &&")

    println(
        "$pistaDisponible && $pilotoAutorizado = ${
            pistaDisponible && pilotoAutorizado
        }"
    )

    println(
        "$pistaDisponible && $vueloActivo = ${
            pistaDisponible && vueloActivo
        }"
    )

    // =========================
    // Operador OR ||
    // =========================

    println("Operador OR ||")

    println(
        "$pistaDisponible || $pilotoAutorizado = ${
            pistaDisponible || pilotoAutorizado
        }"
    )

    println(
        "$pistaDisponible || $vueloActivo = ${
            pistaDisponible || vueloActivo
        }"
    )

    println(
        "$climaFavorable || $pilotoAutorizado = ${
            climaFavorable || pilotoAutorizado
        }"
    )

    println(
        "$climaFavorable || $pilotoAutorizado || $vueloActivo = ${
            climaFavorable || pilotoAutorizado || vueloActivo
        }"
    )

    // =========================
    // Operador NOT !
    // =========================

    println("Operador NOT !")

    println(
        "!$pistaDisponible = ${!pistaDisponible}"
    )

    println(
        "!$climaFavorable = ${!climaFavorable}"
    )

    // =========================
    // Entrada de datos
    // =========================

    println("Ingrese el código del vuelo:")

    val codigoVuelo = readLine()

    println("Código ingresado: $codigoVuelo")
}