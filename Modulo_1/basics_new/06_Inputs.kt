fun main(){
    println("Inputs")
    println("Escribe nombre")
    val nombre= readLine()
    println("Hola $nombre")
    
    
    println("Escribe tu edad:")
    val edad=readLine()?.toDoubleOrNull()?:0.00
    println("Su edad es $edad")
    
    
    val doble = edad*2
    println("El doble de tu edad es: ${doble}")
    println("El doble de tu edad es: ${edad*2}")
}
