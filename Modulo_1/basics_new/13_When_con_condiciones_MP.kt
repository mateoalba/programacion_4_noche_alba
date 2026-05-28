// When con condiciones
// Sistema de control de vuelos de un aeropuerto

fun main() {

    println("When con condiciones")

    println("Ingrese la cantidad de pasajeros del vuelo:")

    val pasajeros = readLine()?.toIntOrNull() ?: 0

    println("¿El vuelo es internacional? (s/n)")

    val esInternacional =
        readLine()?.trim()?.lowercase() == "s"

    val prioridad = if (esInternacional) {

        println(
            "Nivel de prioridad del vuelo (BAJA, MEDIA, ALTA)"
        )

        readLine()?.trim()?.uppercase() ?: ""

    } else {

        ""
    }

    // =====================================
    // Clasificación del vuelo
    // =====================================

    val categoria = when {

        !esInternacional && pasajeros < 50 ->
            "Vuelo nacional de baja ocupación"

        !esInternacional && pasajeros <= 150 ->
            "Vuelo nacional de ocupación media"

        !esInternacional && pasajeros > 150 ->
            "Vuelo nacional de alta ocupación"

        prioridad == "BAJA" ->
            "Vuelo internacional con prioridad baja"

        prioridad == "MEDIA" ->
            "Vuelo internacional con prioridad media"

        prioridad == "ALTA" ->
            "Vuelo internacional prioritario"

        else ->
            "Categoría no registrada"
    }

    // =====================================
    // Resultado
    // =====================================

    println("Clasificación del vuelo: $categoria")
}