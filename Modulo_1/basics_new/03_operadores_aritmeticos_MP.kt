fun main() {

    // Sistema de Control de Vuelos - Operadores

    val vuelosProgramados = 10
    val vuelosRetrasados = 2

    println("Operaciones del aeropuerto")

    println("Suma")
    println(
        "$vuelosProgramados + $vuelosRetrasados = ${
            vuelosProgramados + vuelosRetrasados
        }"
    )

    println("Resta")
    println(
        "$vuelosProgramados - $vuelosRetrasados = ${
            vuelosProgramados - vuelosRetrasados
        }"
    )

    println("Multiplicación")
    println(
        "$vuelosProgramados * $vuelosRetrasados = ${
            vuelosProgramados * vuelosRetrasados
        }"
    )

    println("División")
    println(
        "$vuelosProgramados / $vuelosRetrasados = ${
            vuelosProgramados / vuelosRetrasados
        }"
    )

    println("Módulo")
    println(
        "$vuelosProgramados % $vuelosRetrasados = ${
            vuelosProgramados % vuelosRetrasados
        }"
    )

    // =====================================
    // Operadores de asignación compuesta
    // =====================================

    println("Operadores de asignación compuesta")

    var pasajerosTerminal = 100

    pasajerosTerminal += 25
    println("Llegan pasajeros -> $pasajerosTerminal")

    pasajerosTerminal -= 10
    println("Salen pasajeros -> $pasajerosTerminal")

    pasajerosTerminal *= 2
    println("Duplicación de pasajeros -> $pasajerosTerminal")

    pasajerosTerminal /= 5
    println("Distribución en terminales -> $pasajerosTerminal")

    pasajerosTerminal %= 6
    println("Pasajeros restantes -> $pasajerosTerminal")

    // =====================================
    // Incremento y decremento
    // =====================================

    println("Incremento y decremento")

    var puertasAbiertas = 5

    puertasAbiertas++
    println("Puertas abiertas: $puertasAbiertas")

    puertasAbiertas--
    println("Puertas abiertas después del cierre: $puertasAbiertas")
}