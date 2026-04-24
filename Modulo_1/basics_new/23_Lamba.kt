fun main() {
    println("Funcion Lamba")
    val suma1:(Int, Int)->Int={a: Int, b: Int -> a + b}
    println(suma1(5, 3) )
    //Inferido
    val suma2:(Int, Int)->Int={a, b -> a + b}
    println(suma2(1, 2) )
    //parametro implicito it
    val duplicar:(Int)->Int={it * 2}
    println(duplicar(4) )
    
}