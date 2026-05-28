// Clase Avion
class Avion(
    val modelo: String,
    val capacidad: Int
) {

    // Propiedad calculada
    val categoria: String
        get() = when {
            capacidad <= 100 -> "Avión pequeño"
            capacidad <= 200 -> "Avión mediano"
            else -> "Avión grande"
        }

    // Constructor secundario
    // Avión de carga
    constructor(modelo: String) : this(modelo, 50)

    // Constructor secundario con Int
    constructor(capacidad: Int) : this("Modelo genérico", capacidad)

    override fun toString() =
        "Avión($modelo | capacidad=$capacidad | categoría=$categoria)"
}

fun main() {

    val avion1 = Avion("Boeing 737", 180)

    val avion2 = Avion("Cessna 208")

    val avion3 = Avion(320)

    println(avion1)

    println(avion2)

    println(avion3)
}