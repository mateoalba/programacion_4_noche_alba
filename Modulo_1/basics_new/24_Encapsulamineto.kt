// Definición de la clase Producto
class Producto(
    val id: Int,
    val nombre: String,
    val precio: Double,
    val stock: Int
) {
    // Método que devuelve true si hay stock disponible
    fun disponible(): Boolean = stock > 0

    // Propiedad calculada: precio con IVA (21%)
    val precioConIva: Double
        get() = precio * 1.21

    // Representación en texto
    override fun toString(): String = "$nombre ($${String.format("%.2f", precio)})"
}

// Función principal
fun main() {
    println("Programación Orientada a Objeto")
    println("Abstraccion")
    
    val teclado = Producto(1, "Teclado", 88.99, 15)
    println(teclado)   // Teclado ($88.99)
    println(teclado.disponible())   // true
    println(teclado.precioConIva)   // 107.6779
    
    val monitor = Producto(1, "Monitor", 300.2, 10)
    println(monitor.disponible())   // true
    println(monitor.precioConIva)   // 363.242
    
    println("Encapsulamiento")
    println("Herencia")
}