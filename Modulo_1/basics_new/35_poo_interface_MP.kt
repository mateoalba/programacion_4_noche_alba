// =========================================
// Interfaces
// =========================================
interface Registrable {

    val codigo: String

    fun registrar(): String

    val terminal: String
        get() = "Terminal Internacional"
}

interface Verificable {

    val errores: List<String>

    val esValido: Boolean
        get() = errores.isEmpty()

    fun verificar(): Boolean

    fun imprimirErrores() {

        if (errores.isEmpty()) {

            println("Sin errores")

        } else {

            errores.forEach {
                println("❌ $it")
            }
        }
    }
}

// =========================================
// Clase que implementa interfaces
// =========================================
data class Vuelo(

    override val codigo: String,

    val destino: String,

    val pasajeros: Int,

    val retraso: Int

) : Registrable, Verificable {

    override fun registrar() =
        "$codigo|$destino|$pasajeros pasajeros|$retraso min retraso"

    override val errores: List<String>
        get() = buildList {

            if (destino.isBlank()) {
                add("El destino no puede estar vacío")
            }

            if (pasajeros <= 0) {
                add("Debe existir al menos un pasajero")
            }

            if (retraso < 0) {
                add("El retraso no puede ser negativo")
            }
        }

    override fun verificar() = esValido
}

// =========================================
// MAIN
// =========================================
fun main() {

    val vuelo1 = Vuelo(
        "UIO101",
        "Madrid",
        180,
        25
    )

    val vuelo2 = Vuelo(
        "GYE404",
        "",
        0,
        -5
    )

    // POLIMORFISMO
    fun procesarRegistro(
        r: Registrable
    ) {

        println(
            "→ ${r.registrar()}"
        )
    }

    fun procesarVerificacion(
        v: Verificable
    ) {

        println(
            "Válido: ${v.esValido}"
        )

        v.imprimirErrores()
    }

    procesarRegistro(vuelo1)

    println()

    procesarVerificacion(vuelo1)

    println()

    procesarVerificacion(vuelo2)
}