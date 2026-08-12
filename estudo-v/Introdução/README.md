# Introdução à linguagem V

## Criando um projeto

Na linguagem V, existem diferentes formas de iniciar um projeto. A própria ferramenta de linha de comando (CLI) do V fornece alguns comandos para criar e inicializar projetos.

### `v init`

O comando [`v init`](./exemplos/app-init/main.v) inicializa um projeto V na pasta atual.

Por exemplo:

```bash
v init
```

### `v new`

O comando [`v new`](./exemplos/app/main.v) cria um novo projeto em uma pasta especificada.

Por exemplo:

```bash
v new app
```

Nesse exemplo, será criada uma nova pasta chamada `app`, contendo a estrutura inicial de um projeto V e um exemplo de `Hello World`.

### `v new --web`

Também é possível criar um projeto web utilizando o template do [`veb`](./exemplos/projeto_web/), o framework web do V.

Por exemplo:

```bash
v new --web projeto_web
```

Esse comando cria uma nova pasta chamada `projeto-web` utilizando a estrutura inicial do `veb`.

---

## Hello World

Depois de criar um projeto, podemos escrever nosso primeiro `Hello World` em V.

Crie um arquivo chamado `main.v`:

```v
fn main() {
    println("Hello World")
}
```

Para executar esse código, basta utilizar o seguinte comando:

```bash
v run main.v
```

Se tudo estiver correto, a seguinte mensagem será exibida no terminal:

```text
Hello World
```

Também podemos compilar o programa utilizando:

```bash
v main.v
```

Nesse caso, o V irá gerar o executável do programa.

---

## Uma pequena particularidade do V

Uma coisa interessante é que, em arquivos `.v` simples, podemos escrever um programa sem declarar explicitamente a função `main`.

Por exemplo:

```v
println("Hello World!")
```

O V permite essa forma mais simples para pequenos programas e exemplos.

---

## Impressão e saída de dados

O V possui algumas funções para realizar a saída de dados por meio dos fluxos de E/S (Entrada e Saída).

Entre elas estão:

- `print`
- `println`
- `eprint`
- `eprintln`
- `panic`

Cada uma possui um comportamento diferente, por isso é importante entender quando utilizar cada função.

### `print`

A função `print` tem como objetivo imprimir um texto sem adicionar uma quebra de linha (`\n`) ao final.

Por exemplo:

```v
print("Mensagem sem quebra de linha")
print("Continuação da mensagem")
```

A saída será semelhante a:

```text
Mensagem sem quebra de linhaContinuação da mensagem
```

### `println`

A função `println` possui um comportamento semelhante ao `print`, mas adiciona uma quebra de linha ao final da mensagem.

Por exemplo:

```v
println("Mensagem com quebra de linha")
println("Nova mensagem")
```

A saída será:

```text
Mensagem com quebra de linha
Nova mensagem
```

### `eprint`

A função `eprint` possui um comportamento semelhante ao `print`, porém escreve a mensagem no fluxo de erro padrão (`stderr`).

Por exemplo:

```v
eprint("Ocorreu um erro")
```

O `stderr` é um fluxo separado da saída padrão (`stdout`) e normalmente é utilizado para mensagens relacionadas a erros.

### `eprintln`

A função `eprintln` possui um comportamento semelhante ao `eprint`, mas adiciona uma quebra de linha ao final da mensagem.

Por exemplo:

```v
eprintln("Ocorreu um erro")
```

### `panic`

A função `panic` é utilizada para exibir uma mensagem e encerrar a execução do programa.

Por exemplo:

```v
fn main() {
    println("Início do programa")

    panic("Algo deu errado")

    println("Fim do programa")
}
```

A saída será semelhante a:

```text
Início do programa
Algo deu errado
```

Como o `panic` encerra a execução do programa, o segundo `println` não será executado.

---

## Comentários em V

Os comentários são utilizados para adicionar informações ao código sem que elas sejam executadas pelo programa.

Na linguagem V, podemos utilizar dois tipos principais de comentários.

### Comentário de uma linha

Para criar um comentário de uma linha, utilizamos `//`:

```v
// Este é um comentário de uma linha
println("Hello World!")
```

### Comentário de múltiplas linhas

Para comentários que ocupam várias linhas, podemos utilizar `/* */`:

```v
/*
    Este é um comentário
    de múltiplas linhas.
*/

println("Hello World!")
```

Esse tipo de comentário é bastante comum em diversas linguagens de programação, como C#, Java, Rust e Go.

---

## O que eu aprendi

Nesta primeira etapa, aprendi algumas das formas disponíveis para criar e inicializar projetos em V utilizando a CLI da linguagem.

Também aprendi como executar e compilar um programa, além de conhecer algumas das funções básicas utilizadas para saída de dados, como `print`, `println`, `eprint`, `eprintln` e `panic`.

Uma das características que mais me chamou atenção foi a possibilidade de escrever programas simples sem precisar declarar explicitamente uma função `main`.

Também tive meu primeiro contato com os fluxos `stdout` e `stderr`, utilizados respectivamente para a saída padrão e para mensagens de erro.

Durante os próximos capítulos, pretendo aprofundar meus conhecimentos sobre outros recursos da linguagem e entender melhor como V funciona em aplicações maiores.

---

[← Voltar para a página anterior](../../README.md)

[Variáveis e Tipos →](../variaveis-tipos/README.md)
