// If con condiciones anidadas
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("If con condiciones anidadas")

    println("¿El vuelo es internacional? (s/n)")

    val vueloInternacional =
        readLine()?.trim()?.lowercase() == "s"

    println("Ingrese la cantidad de minutos de retraso:")

    val retraso = readLine()?.toIntOrNull() ?: 0

    // =====================================
    // Condiciones anidadas
    // =====================================

    if (vueloInternacional) {

        println("Vuelo internacional registrado")

        if (retraso > 60) {

            println("Retraso crítico en vuelo internacional")

        } else {

            println("Vuelo internacional dentro del rango permitido")
        }

    } else {

        println("Vuelo nacional registrado")

        if (retraso < 0 || retraso > 45) {

            println("Retraso fuera de lo normal")

        } else {

            println("Vuelo nacional en horario normal")
        }
    }
}