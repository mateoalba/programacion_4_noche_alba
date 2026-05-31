fun main() {

    println("Utilidades de listas - Sistema de vuelos")

    val pasajeros = listOf(
        45, 120, 80, 200, 35,
        160, 95, 220, 60, 140
    )

    println(pasajeros)

    // =========================================
    // MAP
    // =========================================
    println("MAP")

    // Incrementar pasajeros simulando reservas
    val pasajerosActualizados = pasajeros.map { it + 10 }

    println(pasajerosActualizados)

    // Convertir a texto
    val vuelosTexto = pasajeros.map { "Vuelo con $it pasajeros" }

    println(vuelosTexto)

    // =========================================
    // FILTER
    // =========================================
    println("FILTER")

    // Vuelos con más de 100 pasajeros
    val vuelosGrandes = pasajeros.filter { it > 100 }

    println(vuelosGrandes)

    // Vuelos pequeños
    val vuelosPequenos = pasajeros.filter { it < 80 }

    println(vuelosPequenos)

    // Combinar condiciones
    val vuelosPrioritarios =
        pasajeros.filter { it > 100 && it < 200 }

    println(vuelosPrioritarios)

    // filterNot
    val vuelosNoGrandes =
        pasajeros.filterNot { it > 150 }

    println(vuelosNoGrandes)
}