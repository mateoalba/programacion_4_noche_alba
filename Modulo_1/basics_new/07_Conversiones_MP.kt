// Conversiones de datos
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("Conversiones - Sistema de Aeropuerto")

    // =====================================
    // Entero a otros tipos numéricos
    // =====================================

    println("Conversión de Entero a otros tipos")

    val pasajeros = 180

    val pasajerosDouble: Double = pasajeros.toDouble()
    val pasajerosLong: Long = pasajeros.toLong()
    val pasajerosString: String = pasajeros.toString()

    println("Pasajeros en Double: $pasajerosDouble")
    println("Pasajeros en Long: $pasajerosLong")
    println("Pasajeros en String: $pasajerosString")

    // =====================================
    // String a numérico
    // =====================================

    println("Conversión de String a numérico")

    val vuelosTexto = "25"
    val retrasoTexto = "15.5"

    val vuelos = vuelosTexto.toInt()
    val retraso = retrasoTexto.toDouble()

    println("Cantidad de vuelos: $vuelos")
    println("Minutos de retraso: $retraso")

    // =====================================
    // Conversión segura
    // =====================================

    val codigoInvalido = "AVX"

    val numeroInvalido = codigoInvalido.toIntOrNull()

    println("Resultado de conversión inválida: $numeroInvalido")
}