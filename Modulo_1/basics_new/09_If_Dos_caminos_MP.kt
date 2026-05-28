// Control de flujo - if else
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("Control de flujo")
    println("if - Dos caminos")

    println("¿El vuelo tiene autorización de despegue? (s/n)")

    val autorizado = readLine()?.trim()?.lowercase() == "s"

    println("Ingrese la cantidad de pasajeros del vuelo:")

    val pasajeros = readLine()?.toIntOrNull() ?: 0

    // =====================================
    // Condicional if else
    // =====================================

    if (autorizado) {

        val pasajerosPermitidos = pasajeros

        println(
            "Vuelo autorizado para despegar con $pasajerosPermitidos pasajeros"
        )

    } else {

        println(
            "Vuelo NO autorizado. Los $pasajeros pasajeros deben esperar."
        )
    }
}