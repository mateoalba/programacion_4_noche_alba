// Sin open — no se puede heredar
class EmpleadoAeropuerto(
    val nombre: String
)

// class Piloto : EmpleadoAeropuerto("Carlos")
// ERROR porque la clase es final

// =========================================
// Clase base
// =========================================
open class PersonalAeropuerto(
    val nombre: String,
    val rol: String
) {

    // Puede sobrescribirse
    open fun trabajar() {
        println("$nombre trabaja como $rol")
    }

    open fun descripcion() =
        "Empleado: $nombre"

    // No puede sobrescribirse
    fun registrarIngreso() {
        println("$nombre registró ingreso")
    }
}

// =========================================
// HERENCIA
// =========================================
class Piloto(nombre: String) :
    PersonalAeropuerto(nombre, "Piloto") {

    override fun trabajar() {

        super.trabajar()

        println(
            "$nombre está preparando el despegue"
        )
    }

    override fun descripcion() =
        "${super.descripcion()}, piloto comercial"
}

class ControladorAereo(
    nombre: String,
    val torre: String
) : PersonalAeropuerto(
    nombre,
    "Controlador aéreo"
) {

    override fun descripcion() =
        "${super.descripcion()}, asignado a la torre $torre"
}

fun main() {

    val piloto = Piloto("Carlos")

    piloto.trabajar()

    /*
    Carlos trabaja como Piloto
    Carlos está preparando el despegue
    */

    val controlador =
        ControladorAereo(
            "Andrea",
            "Torre Norte"
        )

    println(controlador.descripcion())

    // Heredado de PersonalAeropuerto
    piloto.registrarIngreso()
}