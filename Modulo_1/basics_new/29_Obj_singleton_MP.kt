object TorreControl {

    val aeropuerto: String = "Aeropuerto Internacional UIO"

    val pistasActivas: Int = 3

    private val codigoInterno: String = "CTRL-7788"

    fun informacion() =
        "Aeropuerto: $aeropuerto | Pistas activas: $pistasActivas"

    fun credenciales() =
        mapOf(
            "codigo" to codigoInterno
        )
}

class Piloto private constructor(
    val id: Int,
    val nombre: String
) {

    companion object {

        private var contadorId = 0

        // Factory function
        fun crear(
            nombre: String,
            licencia: String
        ): Piloto? {

            if (
                nombre.isBlank() ||
                licencia.length < 5
            ) {
                return null
            }

            return Piloto(
                ++contadorId,
                nombre.trim()
            )
        }

        const val RANGO_DEFECTO = "Copiloto"
    }

    override fun toString(): String {
        return "Piloto(id=$id, nombre=$nombre)"
    }
}

fun main() {

    println(
        TorreControl.informacion()
    )

    // ERROR porque es privado
    // println(TorreControl.codigoInterno)

    val piloto1 = Piloto.crear(
        "Mateo Alba",
        "LIC12345"
    )

    println(piloto1)

    val piloto2 = Piloto.crear(
        "",
        "12"
    )

    println(piloto2)

    println(
        "Rango por defecto: ${
            Piloto.RANGO_DEFECTO
        }"
    )
}