fun main() {

    println("Listas - Sistema de control de vuelos")
    println("")

    // =========================================
    // Lista inmutable
    // =========================================
    val vuelos = listOf(
        "UIO101",
        "GYE202",
        "CUE303",
        "MEC404",
        "LOJ505"
    )

    println(vuelos)

    println("Cantidad de vuelos: ${vuelos.size}")

    println("Primer vuelo: ${vuelos[0]}")

    println("Primer vuelo con first(): ${vuelos.first()}")

    println("Último vuelo: ${vuelos.last()}")

    println("Vuelo índice 2: ${vuelos.get(2)}")

    println(
        "Posición del vuelo GYE202: ${
            vuelos.indexOf("GYE202")
        }"
    )

    println(
        "Existe el vuelo LOJ505: ${
            vuelos.contains("LOJ505")
        }"
    )

    println(
        "Existe el vuelo UIO999: ${
            "UIO999" in vuelos
        }"
    )

    // =========================================
    // Sublistas
    // =========================================
    println("Sublista: ${vuelos.subList(1, 4)}")

    println("Primeros 2 vuelos: ${vuelos.take(2)}")

    println("Omitir primeros 3 vuelos: ${vuelos.drop(3)}")

    println("Últimos 2 vuelos: ${vuelos.takeLast(2)}")

    println(vuelos)

    // =========================================
    // Lista mutable
    // =========================================
    println("Listas mutables")

    val puertas = mutableListOf(
        "Puerta A1",
        "Puerta A2",
        "Puerta B1",
        "Puerta B2"
    )

    println(puertas)

    puertas.add("Puerta C1")
    println(puertas)

    puertas.add(0, "Puerta VIP")
    println(puertas)

    puertas.remove("Puerta C1")

    puertas[1] = "Puerta Internacional"

    println(puertas)

    // =========================================
    // ArrayDeque
    // =========================================
    println("Cola de aterrizajes")

    val aterrizajes = ArrayDeque<Int>()

    println(aterrizajes)

    aterrizajes.addFirst(101)
    println(aterrizajes)

    aterrizajes.addFirst(202)
    println(aterrizajes)

    aterrizajes.addLast(303)
    println(aterrizajes)

    aterrizajes.removeFirst()
    println(aterrizajes)

    aterrizajes.removeLast()
    println(aterrizajes)
}