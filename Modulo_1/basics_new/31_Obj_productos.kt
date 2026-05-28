data class Categoria(val id: Int, val nombre: String)

data class Producto(
    val id:        Int,
    val nombre:    String,
    val precio:    Double,
    val stock:     Int,
    val categoria: Categoria,
    val activo:    Boolean = true
) {
    val disponible: Boolean get() = activo && stock > 0
    val precioConIva: Double get() = precio * 1.19

    fun aplicarDescuento(porcentaje: Double): Producto {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

object CatalogoProductos {
    private val categorias = mutableListOf(
        Categoria(1, "Periféricos"),
        Categoria(2, "Pantallas"),
        Categoria(3, "Audio")
    )
    private val productos   = mutableListOf<Producto>()
    private var siguienteId = 1

    fun agregarProducto(nombre: String, precio: Double, stock: Int, categoriaId: Int): Producto? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val producto  = Producto(siguienteId++, nombre, precio, stock, categoria)
        productos.add(producto)
        return producto
    }

    fun listar(): List<Producto>              = productos.toList()
    fun disponibles(): List<Producto>         = productos.filter { it.disponible }
    fun porCategoria(id: Int): List<Producto> = productos.filter { it.categoria.id == id }
    fun buscar(query: String): List<Producto> =
        productos.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun imprimirProducto(producto: Producto) {
    println("-------------------------------")
    println("ID:        ${producto.id}")
    println("Nombre:    ${producto.nombre}")
    println("Categoría: ${producto.categoria.nombre}")
    println("Precio:    $${"%.2f".format(producto.precio)}")
    println("Con IVA:   $${"%.2f".format(producto.precioConIva)}")
    println("Stock:     ${producto.stock} unidades")
    println("Estado:    ${if (producto.disponible) "Disponible ✅" else "Sin stock ❌"}")
    println("-------------------------------")
}

fun main() {
    CatalogoProductos.agregarProducto("Teclado mecánico",   89.99, 15, 1)
    CatalogoProductos.agregarProducto("Mouse inalámbrico",  29.99,  0, 1)
    CatalogoProductos.agregarProducto("Monitor 27\"",      349.99,  5, 2)
    CatalogoProductos.agregarProducto("Auriculares BT",    149.99,  8, 3)

    println("=== Todos los productos ===")
    CatalogoProductos.listar().forEach { imprimirProducto(it) }

    println("\n=== Disponibles con 10% descuento ===")
    CatalogoProductos.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { imprimirProducto(it) }
}