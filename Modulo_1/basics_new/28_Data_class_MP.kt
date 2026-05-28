data class Vuelo(
    val id: Int,
    val codigo: String,
    val pasajeros: Int,
    val destino: String,
    val puntual: Boolean = true
)

fun main() {

    val vuelo1 = Vuelo(
        1,
        "UIO101",
        180,
        "Madrid"
    )

    val vuelo2 = Vuelo(
        1,
        "UIO101",
        180,
        "Madrid"
    )

    val vuelo3 = Vuelo(
        2,
        "MIA404",
        220,
        "Miami"
    )

    // toString() automático
    println(vuelo1)

    // equals() por valor
    println(vuelo1 == vuelo2)
    println(vuelo1 == vuelo3)

    // copy()
    val vueloRetrasado =
        vuelo1.copy(puntual = false)

    val vueloConMasPasajeros =
        vuelo1.copy(pasajeros = 200)

    println(vueloRetrasado)

    println(vueloConMasPasajeros)

    // Desestructuración
    val (id, codigo, pasajeros) = vuelo1

    println(
        "$id: $codigo - pasajeros: $pasajeros"
    )

    // En bucles
    listOf(vuelo1, vuelo3).forEach {
        (id2, codigo2, pasajeros2) ->

        println(
            "[$id2] $codigo2: $pasajeros2 pasajeros"
        )
    }
}