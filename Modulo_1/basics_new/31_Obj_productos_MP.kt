data class Destino(
    val id: Int,
    val ciudad: String
)

data class Vuelo(
    val id: Int,
    val codigo: String,
    val pasajeros: Int,
    val capacidad: Int,
    val destino: Destino,
    val activo: Boolean = true
) {

    // Verifica disponibilidad
    val disponible: Boolean
        get() = activo && pasajeros < capacidad

    // Porcentaje de ocupación
    val porcentajeOcupacion: Double
        get() = (pasajeros.toDouble() / capacidad) * 100

    // Incrementar pasajeros
    fun agregarPasajeros(
        cantidad: Int
    ): Vuelo {

        require(cantidad > 0) {
            "La cantidad debe ser mayor a 0"
        }

        return copy(
            pasajeros = pasajeros + cantidad
        )
    }
}

object ControlVuelos {

    private val destinos = mutableListOf(
        Destino(1, "Madrid"),
        Destino(2, "Miami"),
        Destino(3, "Bogotá")
    )

    private val vuelos =
        mutableListOf<Vuelo>()

    private var siguienteId = 1

    fun agregarVuelo(
        codigo: String,
        pasajeros: Int,
        capacidad: Int,
        destinoId: Int
    ): Vuelo? {

        val destino =
            destinos.find {
                it.id == destinoId
            } ?: return null

        val vuelo = Vuelo(
            siguienteId++,
            codigo,
            pasajeros,
            capacidad,
            destino
        )

        vuelos.add(vuelo)

        return vuelo
    }

    fun listar(): List<Vuelo> =
        vuelos.toList()

    fun disponibles(): List<Vuelo> =
        vuelos.filter { it.disponible }

    fun porDestino(
        id: Int
    ): List<Vuelo> =
        vuelos.filter {
            it.destino.id == id
        }

    fun buscar(
        query: String
    ): List<Vuelo> =
        vuelos.filter {
            it.codigo.contains(
                query,
                ignoreCase = true
            )
        }
}

fun imprimirVuelo(vuelo: Vuelo) {

    println("--------------------------------")

    println("ID: ${vuelo.id}")

    println("Código: ${vuelo.codigo}")

    println(
        "Destino: ${vuelo.destino.ciudad}"
    )

    println(
        "Pasajeros: ${vuelo.pasajeros}"
    )

    println(
        "Capacidad: ${vuelo.capacidad}"
    )

    println(
        "Ocupación: ${
            "%.2f".format(
                vuelo.porcentajeOcupacion
            )
        }%"
    )

    println(
        "Estado: ${
            if (vuelo.disponible)
                "Disponible ✅"
            else
                "Completo ❌"
        }"
    )

    println("--------------------------------")
}

fun main() {

    ControlVuelos.agregarVuelo(
        "UIO101",
        120,
        180,
        1
    )

    ControlVuelos.agregarVuelo(
        "MIA404",
        220,
        220,
        2
    )

    ControlVuelos.agregarVuelo(
        "BOG202",
        90,
        150,
        3
    )

    println("=== Todos los vuelos ===")

    ControlVuelos.listar()
        .forEach {
            imprimirVuelo(it)
        }

    println(
        "\n=== Vuelos disponibles ==="
    )

    ControlVuelos.disponibles()
        .map {
            it.agregarPasajeros(5)
        }
        .forEach {
            imprimirVuelo(it)
        }
}