// =========================================
// Interfaces
// =========================================
interface TorreControl {

    fun reportar() =
        println("📡 Reporte desde Torre de Control")
}

interface SeguridadAeropuerto {

    fun reportar() =
        println("🛂 Reporte desde Seguridad")
}

// =========================================
// Clase que implementa ambas interfaces
// =========================================
class CentroOperaciones :
    TorreControl,
    SeguridadAeropuerto {

    // Obligatorio porque ambas interfaces
    // tienen el mismo método
    override fun reportar() {

        super<TorreControl>.reportar()

        super<SeguridadAeropuerto>.reportar()

        println(
            "✈️ Reporte central del aeropuerto"
        )
    }
}

// =========================================
// MAIN
// =========================================
fun main() {

    val centro =
        CentroOperaciones()

    centro.reportar()
}