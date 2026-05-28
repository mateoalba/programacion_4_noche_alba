// Operadores de comparación
// Sistema de control de vuelos de un aeropuerto

fun main() {

    var vuelosProgramados = 10
    var vuelosRetrasados = 3

    println("Comparaciones de vuelos")

    println(
        "vuelosProgramados == vuelosRetrasados -> ${
            vuelosProgramados == vuelosRetrasados
        }"
    )

    println(
        "vuelosProgramados != vuelosRetrasados -> ${
            vuelosProgramados != vuelosRetrasados
        }"
    )

    println(
        "vuelosProgramados > vuelosRetrasados -> ${
            vuelosProgramados > vuelosRetrasados
        }"
    )

    println(
        "vuelosProgramados < vuelosRetrasados -> ${
            vuelosProgramados < vuelosRetrasados
        }"
    )

    println(
        "vuelosProgramados >= vuelosRetrasados -> ${
            vuelosProgramados >= vuelosRetrasados
        }"
    )

    println(
        "vuelosProgramados <= vuelosRetrasados -> ${
            vuelosProgramados <= vuelosRetrasados
        }"
    )

    // =====================================
    // Comparación de Strings
    // =====================================

    var codigoVuelo1 = "AV452"
    var codigoVuelo2 = "AV452"

    println("\nComparación de códigos de vuelo")

    // === compara referencia en memoria
    println(
        "codigoVuelo1 === codigoVuelo2 -> ${
            codigoVuelo1 === codigoVuelo2
        }"
    )

    // == compara contenido
    println(
        "codigoVuelo1 == codigoVuelo2 -> ${
            codigoVuelo1 == codigoVuelo2
        }"
    )

    // equals() compara contenido
    println(
        "codigoVuelo1.equals(codigoVuelo2) -> ${
            codigoVuelo1.equals(codigoVuelo2)
        }"
    )
}