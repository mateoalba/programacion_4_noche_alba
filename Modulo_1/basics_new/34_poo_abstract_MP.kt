// =========================================
// Clase abstracta
// =========================================
abstract class AreaAeropuerto(
    val nombre: String
) {

    // Las subclases deben implementar esto
    abstract val capacidad: Int

    abstract val empleados: Int

    abstract fun descripcion(): String

    // Método reutilizable
    fun comparar(
        otra: AreaAeropuerto
    ): String = when {

        capacidad > otra.capacidad ->
            "$nombre tiene mayor capacidad que ${otra.nombre}"

        capacidad < otra.capacidad ->
            "$nombre tiene menor capacidad que ${otra.nombre}"

        else ->
            "$nombre y ${otra.nombre} tienen la misma capacidad"
    }

    // Polimorfismo
    override fun toString() =
        "${descripcion()} | Capacidad: $capacidad pasajeros"
}

// =========================================
// Subclases
// =========================================
class SalaEspera(
    val puertas: Int
) : AreaAeropuerto(
    "Sala de espera"
) {

    override val capacidad: Int
        get() = puertas * 50

    override val empleados: Int
        get() = puertas * 2

    override fun descripcion() =
        "Sala con $puertas puertas de embarque"
}

class ZonaCheckIn(
    val counters: Int
) : AreaAeropuerto(
    "Zona Check-In"
) {

    override val capacidad: Int
        get() = counters * 30

    override val empleados: Int
        get() = counters * 3

    override fun descripcion() =
        "Zona con $counters counters de atención"
}

class TorreControl(
    val pistas: Int
) : AreaAeropuerto(
    "Torre de control"
) {

    override val capacidad: Int
        get() = pistas * 100

    override val empleados: Int
        get() = pistas * 5

    override fun descripcion() =
        "Torre que administra $pistas pistas"
}

// =========================================
// MAIN
// =========================================
fun main() {

    // POLIMORFISMO
    val areas:
        List<AreaAeropuerto> = listOf(

        SalaEspera(4),

        ZonaCheckIn(6),

        TorreControl(2)
    )

    // toString polimórfico
    areas.forEach {
        println(it)
    }

    val mayor =
        areas.maxByOrNull {
            it.capacidad
        }

    println(
        "\nÁrea con mayor capacidad: ${mayor?.nombre}"
    )

    println(
        areas[0].comparar(areas[1])
    )
}