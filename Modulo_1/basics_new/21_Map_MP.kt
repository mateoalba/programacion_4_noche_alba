fun main() {

    println("Map - Sistema de control de vuelos")

    // =========================================
    // Maps inmutables
    // =========================================
    println("Maps inmutables")

    val vuelos = mapOf(
        "UIO101" to "Quito",
        "GYE202" to "Guayaquil",
        "CUE303" to "Cuenca",
        "MIA404" to "Miami"
    )

    println(vuelos["UIO101"])
    println(vuelos["MAD505"])

    println(
        vuelos.getOrDefault(
            "UIO101",
            "Destino desconocido"
        )
    )

    println(
        vuelos.getOrDefault(
            "MAD505",
            "Destino desconocido"
        )
    )

    println(vuelos.keys)
    println(vuelos.values)
    println(vuelos.entries)
    println(vuelos)

    // Recorrer key y value
    for ((codigo, destino) in vuelos) {

        println("Vuelo: $codigo - Destino: $destino")
    }

    // Recorrer entradas completas
    for (vuelo in vuelos) {

        println("Registro: $vuelo")
    }

    // =========================================
    // Maps mutables
    // =========================================
    println("Maps mutables")

    val pasajeros = mutableMapOf(
        "UIO101" to 120,
        "GYE202" to 95,
        "CUE303" to 70,
        "MIA404" to 180
    )

    // Agregar
    pasajeros["MAD505"] = 210
    println(pasajeros)

    // Modificar
    pasajeros["UIO101"] = 140
    println(pasajeros)

    // Eliminar
    pasajeros.remove("CUE303")
    println(pasajeros)

    // Agregar si no existe
    pasajeros.getOrPut("BOG606") { 160 }
    println(pasajeros)

    // No reemplaza porque ya existe
    pasajeros.getOrPut("GYE202") { 999 }
    println(pasajeros)
}