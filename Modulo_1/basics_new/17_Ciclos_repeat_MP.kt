fun main() {

    println("Ciclos repeat - Control de vuelos")

    println("¿Cuántos vuelos desea registrar?")
    
    val vuelos = readLine()?.toIntOrNull() ?: 3

    var totalPasajeros = 0

    repeat(vuelos) { i ->

        println("Pasajeros del vuelo ${i + 1}:")

        val pasajeros = readLine()?.toIntOrNull() ?: 0

        totalPasajeros += pasajeros
    }

    val promedio = totalPasajeros / vuelos

    println("Promedio de pasajeros por vuelo: $promedio")

    println(
        "Clasificación: ${
            when {
                promedio < 50 -> "Vuelo con baja ocupación"
                promedio <= 150 -> "Vuelo con ocupación normal"
                else -> "Vuelo con alta ocupación"
            }
        }"
    )
}