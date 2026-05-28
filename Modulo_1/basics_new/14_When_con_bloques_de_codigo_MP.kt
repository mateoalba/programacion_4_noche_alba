fun main() {
    println("When con bloques de código - Control de vuelos")

    println("Código del vuelo:")
    val vuelo = readLine()?.trim() ?: ""

    println("Nivel de prioridad del vuelo (CRITICO/URGENTE/MODERADO/NORMAL):")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {
        "CRITICO" -> {
            println("🚨 ALERTA CRÍTICA EN EL VUELO $vuelo")
            println("Activar protocolo de emergencia aérea")
            println("Notificar inmediatamente a torre de control")
        }

        "URGENTE" -> {
            println("⚠️ VUELO URGENTE: $vuelo")
            println("Priorizar pista de aterrizaje")
            println("Coordinar atención inmediata")
        }

        "MODERADO" -> 
            println("🟡 VUELO $vuelo con prioridad moderada, mantener monitoreo")

        "NORMAL" -> 
            println("🟢 VUELO $vuelo operando con normalidad")

        else -> 
            println("Estado del vuelo no reconocido")
    }

    println("Cantidad de pasajeros del vuelo:")
    val pasajeros = readLine()?.toIntOrNull() ?: 0

    val categoria = when (pasajeros) {
        in 0..50 -> "Vuelo pequeño"
        in 51..150 -> "Vuelo mediano"
        in 151..300 -> "Vuelo grande"
        else -> "Vuelo de alta capacidad"
    }

    println("$pasajeros pasajeros -> $categoria")
}