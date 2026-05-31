enum class EstadoVuelo(
    val descripcion: String,
    val finalizado: Boolean
) {

    PROGRAMADO ("Vuelo programado", false),

    EMBARQUE ("Pasajeros abordando", false),

    EN_VUELO ("Vuelo en curso", false),

    ATERRIZADO ("Vuelo finalizado correctamente", true),

    CANCELADO ("Vuelo cancelado", true),

    RETRASADO ("Vuelo retrasado", false);

    fun puedeCambiarA(
        siguiente: EstadoVuelo
    ): Boolean = when (this) {

        PROGRAMADO ->
            siguiente == EMBARQUE ||
            siguiente == CANCELADO ||
            siguiente == RETRASADO

        EMBARQUE ->
            siguiente == EN_VUELO ||
            siguiente == CANCELADO

        EN_VUELO ->
            siguiente == ATERRIZADO

        RETRASADO ->
            siguiente == EMBARQUE ||
            siguiente == CANCELADO

        else -> false
    }
}

fun main() {

    val estado = EstadoVuelo.EMBARQUE

    println(estado.descripcion)

    println(estado.finalizado)

    // when exhaustivo
    val icono = when (estado) {

        EstadoVuelo.PROGRAMADO -> "🗓️"

        EstadoVuelo.EMBARQUE -> "🛫"

        EstadoVuelo.EN_VUELO -> "✈️"

        EstadoVuelo.ATERRIZADO -> "🛬"

        EstadoVuelo.CANCELADO -> "❌"

        EstadoVuelo.RETRASADO -> "⏰"
    }

    println(icono)

    println(
        estado.puedeCambiarA(
            EstadoVuelo.EN_VUELO
        )
    )
}