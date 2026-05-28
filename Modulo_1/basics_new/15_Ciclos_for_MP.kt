fun main() {

    println("CICLOS for - Control de vuelos")

    // =========================================
    // for básico
    // =========================================
    println("Despegues programados")

    for (i in 1..5) {
        println("✈️ Vuelo #$i autorizado para despegue")
    }

    // =========================================
    // until
    // =========================================
    println("Puertas de embarque")

    for (i in 1 until 5) {
        println("🛫 Puerta de embarque G-$i")
    }

    // =========================================
    // downTo
    // =========================================
    println("Cuenta regresiva para aterrizaje")

    for (i in 10 downTo 1) {
        println("⏳ $i")
    }

    // =========================================
    // listas
    // =========================================
    println("Lista de vuelos")

    val vuelos = listOf(
        "UIO123",
        "GYE456",
        "CUE789"
    )

    for (vuelo in vuelos) {
        println("Vuelo registrado: $vuelo")
    }

    // =========================================
    // índice y valor
    // =========================================
    println("Indice y vuelo")

    for ((index, valor) in vuelos.withIndex()) {
        println("$index: $valor")
    }

    // =========================================
    // break
    // =========================================
    println("Control de emergencia")

    for (i in 1..5) {

        if (i == 3) {
            println("🚨 Emergencia detectada")
            break
        }

        println("Vuelo $i operando normalmente")
    }

    // =========================================
    // continue
    // =========================================
    println("Control de vuelos retrasados")

    for (i in 1..5) {

        if (i == 3) {
            println("⚠️ Vuelo $i retrasado")
            continue
        }

        println("Vuelo $i autorizado")
    }
}