fun main() {

    println("Ciclos while - Control de aeropuerto")

    // =========================================
    // While básico
    // =========================================
    println("Registro de vuelos")

    var contador = 1

    while (contador <= 5) {
        println("✈️ Vuelo #$contador registrado")
        contador++
    }

    // =========================================
    // do-while
    // =========================================
    println("Verificación de pistas")

    contador = 1

    do {
        println("🛬 Revisando pista #$contador")
        contador++
    } while (contador <= 5)

    // =========================================
    // break y continue
    // =========================================
    println("Control de despegues")

    contador = 1

    while (contador <= 10) {

        contador++

        // Saltar vuelo retrasado
        if (contador == 3) {
            println("⚠️ Vuelo $contador retrasado")
            continue
        }

        // Emergencia aérea
        if (contador == 7) {
            println("🚨 Emergencia detectada en vuelo $contador")
            break
        }

        println("✅ Vuelo $contador autorizado")
    }

    // =========================================
    // while infinito controlado
    // =========================================
    var input: String

    while (true) {

        println("Escriba 'salir' para cerrar la torre de control")
        input = readLine() ?: ""

        if (input.lowercase() == "salir") {
            println("🛑 Torre de control cerrada")
            break
        }

        println("Mensaje recibido: $input")
    }
}