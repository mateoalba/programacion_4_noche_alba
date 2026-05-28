// Declaración de Variables - Sistema de Control de Vuelos

fun main() {

    // ==============================
    // val → inmutable
    // ==============================
    val aeropuerto = "Aeropuerto Internacional Mariscal Sucre"
    val ciudad = "Quito"

    // Int → entero
    val puertasEmbarque: Int = 28

    // ==============================
    // var → mutable
    // ==============================
    var vuelosActivos = 12
    vuelosActivos = vuelosActivos + 3

    println("$aeropuerto ubicado en $ciudad")
    println("Vuelos activos: $vuelosActivos")

    // ==============================
    // Tipos de datos numéricos
    // ==============================

    // Enteros
    val pista1: Byte = 2
    val terminales: Short = 15
    val pasajerosDia: Int = 12500
    val equipajesProcesados: Long = 2_500_000_000

    println("Pistas disponibles: $pista1")
    println("Terminales: $terminales")
    println("Pasajeros por día: $pasajerosDia")
    println("Equipajes procesados: $equipajesProcesados")

    // ==============================
    // Números decimales
    // ==============================
    val temperatura: Float = 18.5f
    val velocidadAvion: Double = 845.75

    println("Temperatura actual: $temperatura °C")
    println("Velocidad promedio del avión: $velocidadAvion km/h")

    // ==============================
    // Booleanos
    // ==============================
    val pistaDisponible: Boolean = true
    println("¿Pista disponible?: $pistaDisponible")

    // ==============================
    // Caracteres y Strings
    // ==============================
    val terminal: Char = 'A'
    val codigoVuelo: String = "UIO245"

    println("Terminal asignada: $terminal")
    println("Código de vuelo: $codigoVuelo")

    // Inferencia de tipo
    val aerolinea = "LATAM"

    println("Tipo de aerolinea: ${aerolinea::class.simpleName}")

    val capacidadAvion = 180
    println("Tipo de capacidadAvion: ${capacidadAvion::class.simpleName}")

    // ==============================
    // Utilidades de String
    // ==============================
    val piloto = "Mateo"
    val copiloto = "Alba"

    val pilotoMayuscula = piloto.uppercase()
    val copilotoMayuscula = copiloto.uppercase()

    println("Tripulación: $pilotoMayuscula $copilotoMayuscula")

    println(
        "Vuelo asignado a: ${piloto.uppercase()} ${copiloto.uppercase()}"
    )
}