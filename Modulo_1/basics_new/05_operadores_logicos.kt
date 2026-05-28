fun main() {
    println("Operadores Lógicos")

    val esMayor = true
    val tienePermiso = false
    val estadoActivo = true
    val mayorEdad = false

    println("Operador And &&")
    println("$esMayor && $tienePermiso = ${esMayor && tienePermiso}")
    println("$esMayor && $estadoActivo = ${esMayor && estadoActivo}")

    println("Operador Or ||")
    println("$esMayor || $tienePermiso = ${esMayor || tienePermiso}")
    println("$esMayor || $estadoActivo = ${esMayor || estadoActivo}")
    println("$mayorEdad || $tienePermiso = ${mayorEdad || tienePermiso}")
    println("$mayorEdad || $tienePermiso || $estadoActivo = ${mayorEdad || tienePermiso || estadoActivo}")

    println("Operador Not !")
    println("!$esMayor = ${!esMayor}")
    println("!$mayorEdad = ${!mayorEdad}")
    
    val texto = readLine()
    println(texto)
}