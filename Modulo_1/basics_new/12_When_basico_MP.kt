// Condicional When
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("Condicional When")

    println("Código del área del aeropuerto (1-7)")
    println("1 -> Torre de control")
    println("2 -> Check-in")
    println("3 -> Seguridad")
    println("4 -> Sala de embarque")
    println("5 -> Pista de aterrizaje")
    println("6 -> Equipaje")
    println("7 -> Migración")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val area = when (codigo) {

        1 -> "Torre de control"
        2 -> "Check-in"
        3 -> "Seguridad"
        4 -> "Sala de embarque"
        5 -> "Pista de aterrizaje"
        6 -> "Área de equipaje"
        7 -> "Migración"

        else -> "Área no registrada"
    }

    println("Área seleccionada: $area")
}