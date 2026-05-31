fun main() {

    println("Set - Sistema de control de vuelos")

    // =========================================
    // Sets inmutables
    // =========================================
    println("Sets inmutables")

    val vuelos = setOf(
        "UIO101",
        "GYE202",
        "CUE303",
        "UIO101",
        "GYE202"
    )

    // Los repetidos se eliminan automáticamente
    println(vuelos)

    // =========================================
    // Operaciones de conjuntos
    // =========================================
    println("Operaciones de conjuntos")

    val vuelosNacionales = setOf(
        "UIO101",
        "GYE202",
        "CUE303",
        "MEC404"
    )

    println("Vuelos nacionales: $vuelosNacionales")

    val vuelosInternacionales = setOf(
        "MIA505",
        "MAD606",
        "UIO101"
    )

    println("Vuelos internacionales: $vuelosInternacionales")

    val vuelosRetrasados = setOf(
        "GYE202",
        "MAD606",
        "MEC404"
    )

    println("Vuelos retrasados: $vuelosRetrasados")

    // Unión
    println(
        "Todos los vuelos: ${
            vuelosNacionales union vuelosInternacionales
        }"
    )

    // Intersección
    println(
        "Vuelos repetidos en ambos grupos: ${
            vuelosNacionales intersect vuelosInternacionales
        }"
    )

    println(
        "Vuelos nacionales retrasados: ${
            vuelosNacionales intersect vuelosRetrasados
        }"
    )

    // Substracción
    println(
        "Vuelos nacionales sin retraso: ${
            vuelosNacionales subtract vuelosRetrasados
        }"
    )

    println(
        "Vuelos internacionales sin retraso: ${
            vuelosInternacionales subtract vuelosRetrasados
        }"
    )

    println("Nacionales: $vuelosNacionales")
    println("Internacionales: $vuelosInternacionales")

    // =========================================
    // Sets mutables
    // =========================================
    println("Sets mutables")

    val puertas = mutableSetOf(
        "Puerta A1",
        "Puerta A2",
        "Puerta B1"
    )

    println(puertas)

    // No se duplica
    puertas.add("Puerta A1")
    println(puertas)

    puertas.add("Puerta VIP")
    println(puertas)

    puertas.remove("Puerta A2")
    println(puertas)

    println(
        "Existe Puerta VIP: ${
            "Puerta VIP" in puertas
        }"
    )

    println(
        "Existe Puerta C3: ${
            "Puerta C3" in puertas
        }"
    )
}