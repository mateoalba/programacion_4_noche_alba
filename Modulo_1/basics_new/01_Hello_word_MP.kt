// ==========================================
// DECLARACIÓN DE VARIABLES
// SISTEMA DE CONTROL DE VUELOS
// ==========================================

fun main() {

    // ==========================================
    // val → variable inmutable
    // ==========================================

    val codigoVuelo = "AV203"
    val pasajeros: Int = 180

    // ==========================================
    // var → variable mutable
    // ==========================================

    var vuelosActivos = 5
    vuelosActivos = vuelosActivos + 1

    println("$codigoVuelo tiene $pasajeros pasajeros")
    println("Vuelos activos: $vuelosActivos")

    // ==========================================
    // TIPOS DE DATOS
    // ==========================================

    // Números enteros
    val puertaEmbarque: Byte = 12
    val terminal: Short = 120
    val equipajes: Int = 3500
    val totalPasajerosAnual: Long =
        2_500_000_000

    // Números decimales
    val altitudVuelo: Float = 10500.5f
    val velocidadPromedio: Double = 850.75

    // Boolean
    val vueloAutorizado: Boolean = true

    // Char
    val zonaTerminal: Char = 'A'

    // String
    val aerolinea: String = "Avianca"

    // ==========================================
    // IMPRESIÓN DE DATOS
    // ==========================================

    println("Puerta de embarque: $puertaEmbarque")
    println("Terminal: $terminal")
    println("Equipajes registrados: $equipajes")
    println("Pasajeros anuales: $totalPasajerosAnual")

    println("Altitud del vuelo: $altitudVuelo")
    println("Velocidad promedio: $velocidadPromedio km/h")

    println("Vuelo autorizado: $vueloAutorizado")
    println("Zona de terminal: $zonaTerminal")
    println("Aerolínea: $aerolinea")
}