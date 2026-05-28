fun main(){
    println("Conversiones")
    println("Entero a numerico")
    val entero: Int = 12
    
    val decimal: Double = entero.toDouble()
    val longVariable: Long = entero.toLong()
    val variableString: String = entero.toString()
    
    println("to Double $decimal")
    println("to Long $longVariable")
    println("to String $variableString")
    
    println("String a numerico")
    val numero1 = "1234".toInt()
    val numero2 = "3.1415".toDouble()
    
    val invalido = "abcd".toIntOrNull()
    println("invalido")
}
