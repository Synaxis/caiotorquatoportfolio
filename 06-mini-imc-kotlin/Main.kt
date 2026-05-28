fun lerDouble(rotulo:String):Double{
    print(rotulo)
    return readlnOrNull()?.replace(",",".")?.toDoubleOrNull() ?: 0.0
}
fun faixa(imc:Double)=when{
    imc<18.5 -> "baixo peso"
    imc<25 -> "peso adequado"
    imc<30 -> "sobrepeso"
    else -> "obesidade"
}
fun main(){
    println("Mini IMC - cálculo simples")
    val peso=lerDouble("Peso em kg: ")
    val altura=lerDouble("Altura em metros: ")
    if(peso<=0.0 || altura<=0.0) return println("Entrada inválida.")
    val imc=peso/(altura*altura)
    println("IMC: %.1f - %s".format(imc,faixa(imc)))
}
