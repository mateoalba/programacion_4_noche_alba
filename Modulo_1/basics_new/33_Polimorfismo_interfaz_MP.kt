// La interfaz define QUÉ puede hacer
interface OperacionVuelo {

    fun procesar(cantidad: Int): Boolean

    val nombre: String
}

// =========================================
// Implementaciones
// =========================================
class CheckIn(
    val vuelo: String
) : OperacionVuelo {

    override val nombre =
        "Check-In"

    override fun procesar(
        cantidad: Int
    ): Boolean {

        println(
            "🧳 Registrando $cantidad pasajeros en el vuelo $vuelo"
        )

        return true
    }
}

class Embarque(
    val puerta: String
) : OperacionVuelo {

    override val nombre =
        "Embarque"

    override fun procesar(
        cantidad: Int
    ): Boolean {

        println(
            "🛫 Embarcando $cantidad pasajeros en puerta $puerta"
        )

        return true
    }
}

class ControlSeguridad :
    OperacionVuelo {

    override val nombre =
        "Control de seguridad"

    override fun procesar(
        cantidad: Int
    ): Boolean {

        println(
            "🔍 Revisando $cantidad pasajeros en seguridad"
        )

        return true
    }
}

class Equipaje(
    val cinta: String
) : OperacionVuelo {

    override val nombre =
        "Equipaje"

    override fun procesar(
        cantidad: Int
    ): Boolean {

        println(
            "🎒 Procesando $cantidad maletas en cinta $cinta"
        )

        return true
    }
}

// =========================================
// POLIMORFISMO
// =========================================
fun ejecutarOperacion(
    cantidad: Int,
    operacion: OperacionVuelo
) {

    println(
        "Ejecutando ${operacion.nombre}..."
    )

    val exito =
        operacion.procesar(cantidad)

    println(
        if (exito)
            "✅ Operación exitosa"
        else
            "❌ Operación fallida"
    )
}

fun main() {

    val operaciones:
        List<OperacionVuelo> = listOf(

        CheckIn("UIO101"),

        Embarque("Puerta A5"),

        ControlSeguridad(),

        Equipaje("Cinta 3")
    )

    // Misma función
    // distinto comportamiento
    operaciones.forEach {

        ejecutarOperacion(120, it)

        println()
    }
}