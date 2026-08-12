module main
fn main(){
    mut idade := 21 // transformando a variável idade em mutável

    println(idade) // 21

    idade = 22

    println(idade)// 22


	// Atribuição múltipla
	mut a := 0
    mut b := 1

    println('${a}, ${b}') // 0, 1

    a, b = b, a

    println('${a}, ${b}') // 1, 0
}