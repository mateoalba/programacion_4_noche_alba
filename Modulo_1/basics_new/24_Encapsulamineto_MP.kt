// Definición de la clase Vuelo
class Vuelo(
    val id: Int,
    val codigo: String,
    val pasajeros: Int,
    val capacidad: Int
) {

    // Método que verifica si el vuelo tiene espacio disponible
    fun disponible(): Boolean = pasajeros < capacidad

    // Propiedad calculada: porcentaje de ocupación
    val porcentajeOcupacion: Double
        get() = (pasajeros.toDouble() / capacidad) * 100

    // Representación en texto
    override fun toString(): String =
        "$codigo ($pasajeros/$capacidad pasajeros)"
}

// Función principal
fun main() {

    println("Programación Orientada a Objetos")
    println("Abstracción")

    val vuelo1 = Vuelo(
        1,
        "UIO101",
        120,
        180
    )

    println(vuelo1)
    println(vuelo1.disponible())
    println(
        "Ocupación: ${
            String.format("%.2f", vuelo1.porcentajeOcupacion)
        }%"
    )

    val vuelo2 = Vuelo(
        2,
        "MIA404",
        220,
        220
    )

    println(vuelo2)
    println(vuelo2.disponible())
    println(
        "Ocupación: ${
            String.format("%.2f", vuelo2.porcentajeOcupacion)
        }%"
    )

    println("Encapsulamiento")
    println("Herencia")
}