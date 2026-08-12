# Variáveis e Tipos Primitivos

## Variáveis

Na linguagem V, as variáveis podem ser declaradas e inicializadas utilizando `:=`.

O tipo da variável é **inferido automaticamente** a partir do valor atribuído a ela.

```v
fn main() {
    mensagem := 'Olá, mundo!'
    println(mensagem)
}
```

Nesse exemplo, o compilador infere que `mensagem` é uma variável do tipo `string`.

### Conversão de tipos

Quando for necessário utilizar um tipo específico, é possível realizar uma conversão utilizando a sintaxe `T(v)`, onde `T` representa o tipo desejado e `v` representa o valor que será convertido.

Por exemplo:

```v
fn main() {
    peso := f32(70)

    println(peso)
}
```

Nesse caso, o valor `70` é convertido para `f32`.

---

## Variáveis mutáveis

Por padrão, as variáveis em V são **imutáveis**. Para permitir que uma variável tenha seu valor alterado, é necessário declará-la utilizando `mut`.

```v
fn main() {
    mut idade := 21

    println(idade)

    idade = 22

    println(idade)
}
```

A diferença entre `:=` e `=` é importante:

- `:=` declara e inicializa uma variável.
- `=` atribui um novo valor a uma variável já existente.
- `mut` permite que uma variável tenha seu valor alterado.

Por exemplo:

```v
mut idade := 21
idade = 22
```

Sem `mut`, tentar alterar o valor da variável resultará em um erro de compilação.

---

## Alterando múltiplas variáveis

É possível alterar os valores de múltiplas variáveis em uma única linha. Isso permite, por exemplo, trocar os valores de duas variáveis sem utilizar uma variável intermediária.

```v
fn main() {
    mut a := 0
    mut b := 1

    println('${a}, ${b}') // 0, 1

    a, b = b, a

    println('${a}, ${b}') // 1, 0
}
```

Nesse exemplo, os valores de `a` e `b` são trocados diretamente.

---

## O identificador `_`

Assim como em outras linguagens, o `_` pode ser utilizado quando um valor não é necessário.

Ele é especialmente útil em situações nas quais uma função retorna múltiplos valores, mas apenas alguns deles são relevantes.

```v
_ := "I don't need this value"
println(_) // ERROR: Cannot use `_` as value
```

O `_` é um identificador descartável. Ele não deve ser utilizado posteriormente como uma variável comum.

---

## Regras de nomenclatura

Ao nomear variáveis, algumas convenções devem ser seguidas.

### Snake Case

A linguagem V utiliza **snake_case** como convenção para nomes de identificadores.

Exemplo:

```v
nome_completo := 'Lucas'
idade_usuario := 21
numero_de_telefone := '99999-9999'
```

Evite nomes como:

```v
AlphaTest
nomeCompleto
```

Prefira:

```v
alpha_test
nome_completo
```

### Boas práticas

Ao criar nomes para variáveis:

- Utilize nomes descritivos.
- Prefira `snake_case`.
- Evite letras maiúsculas em identificadores.
- Não utilize espaços.
- Evite nomes contendo `__`.
- Prefira nomes que deixem claro o propósito da variável.

Por exemplo:

```v
nome_usuario := 'Lucas'
idade_usuario := 21
```

é mais descritivo do que:

```v
n := 'Lucas'
i := 21
```

---

# Tipos na linguagem V

## Tipos primitivos

A linguagem V possui diversos tipos primitivos para representar diferentes tipos de dados.

```v
bool       // booleano: true ou false

string     // texto

i8         // inteiro com sinal de 8 bits
i16        // inteiro com sinal de 16 bits
int        // inteiro com sinal de 32 bits
i64        // inteiro com sinal de 64 bits
i128       // inteiro com sinal de 128 bits (em desenvolvimento)

u8         // inteiro sem sinal de 8 bits
u16        // inteiro sem sinal de 16 bits
u32        // inteiro sem sinal de 32 bits
u64        // inteiro sem sinal de 64 bits
u128       // inteiro sem sinal de 128 bits (em desenvolvimento)

rune       // ponto de código Unicode

f32        // número de ponto flutuante de 32 bits
f64        // número de ponto flutuante de 64 bits

isize      // inteiro cujo tamanho depende da plataforma
usize      // inteiro sem sinal cujo tamanho depende da plataforma

voidptr    // ponteiro utilizado principalmente para interoperabilidade com C
```

> **Nota:** ao contrário de C e Go, `int` em V possui sempre 32 bits.

---

## Promoção automática de tipos

Normalmente, os operandos de uma operação precisam possuir tipos compatíveis.

Porém, V permite algumas promoções automáticas de tipos quando um valor de um tipo menor pode ser representado com segurança pelo tipo maior.

As principais possibilidades podem ser representadas da seguinte forma:

```text
i8  → i16 → int → i64
                  ↘
                    f32 → f64

u8  → u16 → u32 → u64
```

Por exemplo, um valor `u16` pode ser promovido para `int` quando utilizado em uma operação compatível.

```v
u := u16(12)
v := 13 + u
```

Nesse caso, `v` será do tipo `u16`, pois o literal `13` pode ser representado por esse tipo sem necessidade de promoção.

Outro exemplo:

```v
x := f32(45.6)
y := x + 3.14
```

Nesse caso, `y` será do tipo `f32`.

### Promoção envolvendo `int`

Também é possível ocorrer promoção automática quando tipos inteiros diferentes são utilizados na mesma expressão.

```v
u := u16(12)
a := 75

c := u + a
```

Nesse caso, `u` pode ser promovido para `int`, resultando em uma expressão cujo tipo é `int`.

A promoção automática existe para facilitar operações entre tipos compatíveis, mas não ocorre quando isso poderia resultar em uma representação inválida ou incompatível.

---

## Literais numéricos

Literais como `123` e `4.56` possuem um comportamento especial.

Quando o compilador precisa determinar seu tipo, os literais inteiros são tratados como `int` por padrão, enquanto os literais de ponto flutuante são tratados como `f64`.

```v
a := 75
b := 14.7
```

Nesse exemplo:

```text
a → int
b → f64
```

Porém, quando um literal é utilizado junto com uma variável que possui outro tipo compatível, o compilador pode determinar o tipo da expressão de acordo com o contexto.

```v
u := u16(12)
v := 13 + u
```

Nesse caso:

```text
v → u16
```

Outro exemplo:

```v
x := f32(45.6)
y := x + 3.14
```

Nesse caso:

```text
y → f32
```

Isso acontece porque os literais numéricos podem assumir o tipo necessário quando o contexto permite.

---

## Resumo

Os principais conceitos apresentados nesta seção são:

| Conceito          | Descrição                                                     |
| ----------------- | ------------------------------------------------------------- |
| `:=`              | Declara e inicializa uma variável                             |
| `=`               | Atribui um novo valor                                         |
| `mut`             | Permite alterar o valor de uma variável                       |
| `_`               | Identificador utilizado para descartar valores                |
| `snake_case`      | Convenção de nomenclatura utilizada em V                      |
| `int`             | Inteiro com 32 bits                                           |
| `f32` / `f64`     | Números de ponto flutuante                                    |
| `i8`–`i64`        | Inteiros com sinal                                            |
| `u8`–`u64`        | Inteiros sem sinal                                            |
| `rune`            | Ponto de código Unicode                                       |
| `isize` / `usize` | Inteiros dependentes da plataforma                            |
| `voidptr`         | Ponteiro utilizado principalmente na interoperabilidade com C |

## O que aprendi

Nesta parte da documentação, aprendi como funciona a declaração e a inicialização de variáveis na linguagem V, além da diferença entre `:=` e `=` e como utilizar `mut` para trabalhar com variáveis mutáveis.

Também aprendi sobre os principais tipos primitivos da linguagem, como `int`, `i8`, `u8`, `f32`, `f64`, `bool`, `string` e `rune`, além do funcionamento da inferência e da conversão de tipos.

Por fim, aprendi sobre as regras de nomenclatura utilizando `snake_case`, o uso do identificador `_` para descartar valores e como funciona a promoção automática de tipos e os literais numéricos em V.

[← Introdução](../Introdução/README.md)

[Próximo capítulo →]()
