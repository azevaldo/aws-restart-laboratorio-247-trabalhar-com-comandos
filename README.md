# AWS re/Start — Laboratório 247: Trabalhar com Comandos

## Sobre o laboratório

Neste laboratório do **AWS re/Start**, foram praticados diferentes comandos Linux utilizados para manipular, organizar e modificar informações em arquivos.

O exercício teve como foco os comandos `tee`, `sort`, `cut` e `sed`, além da utilização do operador **pipe (`|`)** para conectar comandos e direcionar a saída de um comando para outro.

## Objetivos

* Utilizar o comando `tee` para direcionar uma saída para um arquivo.
* Utilizar o comando `sort` para reorganizar o conteúdo de um arquivo `.csv`.
* Utilizar o comando `cut` para extrair partes do conteúdo de um arquivo.
* Utilizar o comando `sed` para substituir textos.
* Utilizar o operador pipe (`|`) para conectar comandos.
* Trabalhar com arquivos CSV no Linux.

## Ambiente

* **Programa:** AWS re/Start
* **Lab:** 247 — Trabalhar com Comandos
* **AWS:** Vocareum
* **Serviço:** Amazon EC2
* **Sistema operacional:** Amazon Linux
* **Acesso:** SSH
* **Sistema utilizado:** Windows
* **Cliente SSH:** PuTTY
* **Chave:** `labsuser.ppk`
* **Usuário:** `ec2-user`

## Conexão com a instância

Como o laboratório foi realizado no Windows, a conexão com a instância EC2 foi feita utilizando o **PuTTY**.

Configuração utilizada:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

Na configuração da autenticação do PuTTY:

```text
Connection
└── SSH
    └── Auth
        └── Credentials
            └── Private key file: labsuser.ppk
```

Após a conexão:

```text
Username: ec2-user
```

> A chave privada `labsuser.ppk` não deve ser adicionada ao repositório.

## Tarefa 2 — Utilizar o comando tee

Primeiro, foi validado o diretório atual:

```bash
pwd
```

O objetivo era trabalhar a partir de:

```text
/home/ec2-user
```

Em seguida, foi utilizado o comando:

```bash
hostname | tee file1.txt
```

O comando `hostname` fornece o nome da máquina.

O operador `|` envia a saída do comando `hostname` para o `tee`.

O `tee` então:

1. Exibe o resultado no terminal.
2. Grava o mesmo resultado no arquivo `file1.txt`.

Para verificar se o arquivo foi criado:

```bash
ls
```

O arquivo `file1.txt` deve aparecer no diretório atual.

### Conceito

```text
hostname
   |
   v
  tee
 /   \
v     v
Tela  file1.txt
```

## Tarefa 3 — Utilizar sort e o operador pipe

Foi criado o arquivo `test.csv`:

```bash
cat > test.csv
```

O conteúdo utilizado foi:

```text
Factory, 1, Paris
Store, 2, Dubai
Factory, 3, Brasilia
Store, 4, Algiers
Factory, 5, Tokyo
```

Depois, foi utilizado:

```bash
sort test.csv
```

O comando `sort` reorganiza as linhas do arquivo em ordem alfabética.

O resultado esperado é:

```text
Factory, 1, Paris
Factory, 3, Brasilia
Factory, 5, Tokyo
Store, 2, Dubai
Store, 4, Algiers
```

### Utilização do pipe

O laboratório também apresenta a utilização do operador `|` para direcionar a saída de um comando para outro.

Foi utilizado:

```bash
find | grep Paris test.csv
```

O objetivo apresentado no laboratório é utilizar o `grep` para procurar o padrão `Paris` relacionado ao arquivo `test.csv`.

O resultado esperado é:

```text
Factory, 1, Paris
```

> O exercício apresenta esse comando exatamente dessa forma. O objetivo aqui é documentar o procedimento praticado no laboratório.

## Tarefa 4 — Utilizar o comando cut

Foi criado o arquivo `cities.csv`:

```bash
cat > cities.csv
```

Com o seguinte conteúdo:

```text
Dallas, Texas
Seattle, Washington
Los Angeles, California
Atlanta, Georgia
New York, New York
```

Para extrair somente o primeiro campo de cada linha:

```bash
cut -d ',' -f 1 cities.csv
```

Resultado:

```text
Dallas
Seattle
Los Angeles
Atlanta
New York
```

### Entendendo o comando

```text
-d ','
```

Define a vírgula como delimitador.

```text
-f 1
```

Seleciona o primeiro campo de cada linha.

Assim, por exemplo:

```text
Dallas, Texas
```

torna-se:

```text
Dallas
```

## Desafio adicional — Utilizar sed

O laboratório apresenta o `sed` como uma ferramenta utilizada principalmente para substituir textos.

A estrutura apresentada é:

```bash
sed 's/texto-original/novo-texto/' arquivo
```

Foi solicitado substituir a **primeira vírgula** por um ponto nos arquivos `cities.csv` e `test.csv`.

Para o arquivo `cities.csv`:

```bash
sed 's/,/./' cities.csv
```

Resultado:

```text
Dallas. Texas
Seattle. Washington
Los Angeles. California
Atlanta. Georgia
New York. New York
```

Para o arquivo `test.csv`:

```bash
sed 's/,/./' test.csv
```

Resultado:

```text
Factory. 1, Paris
Store. 2, Dubai
Factory. 3, Brasilia
Store. 4, Algiers
Factory. 5, Tokyo
```

Nesse caso, o comando altera a primeira ocorrência de `,` em cada linha.

## Principais comandos utilizados

| Comando    | Função                                     |
| ---------- | ------------------------------------------ |
| `pwd`      | Exibe o diretório atual                    |
| `hostname` | Exibe o nome da máquina                    |
| `tee`      | Exibe a saída e também grava em um arquivo |
| `ls`       | Lista arquivos e diretórios                |
| `cat`      | Cria ou exibe conteúdo de arquivos         |
| `sort`     | Ordena as linhas de um arquivo             |
| `find`     | Localiza arquivos e diretórios             |
| `grep`     | Pesquisa padrões de texto                  |
| `cut`      | Extrai campos ou partes de linhas          |
| `sed`      | Processa e substitui textos                |
| `\|`       | Envia a saída de um comando para outro     |

## Conceitos praticados

### Tee

Permite enviar uma saída simultaneamente para o terminal e para um arquivo.

```bash
comando | tee arquivo.txt
```

### Pipe

Permite utilizar a saída de um comando como entrada para outro.

```bash
comando1 | comando2
```

### Sort

Organiza as linhas de um arquivo.

```bash
sort arquivo.csv
```

### Cut

Permite selecionar campos de uma linha utilizando um delimitador.

```bash
cut -d ',' -f 1 arquivo.csv
```

### Sed

Permite realizar substituições e outras transformações no conteúdo.

```bash
sed 's/,/./' arquivo.csv
```

## O que foi aprendido

Neste laboratório, foram praticados:

* redirecionamento de saída com `tee`;
* utilização do operador pipe;
* ordenação de informações com `sort`;
* pesquisa de conteúdo com `grep`;
* extração de campos com `cut`;
* substituição de texto com `sed`;
* criação e manipulação de arquivos CSV;
* combinação de comandos Linux para processamento de informações.

## Conclusão

O laboratório demonstrou como diferentes comandos Linux podem ser combinados para trabalhar com informações de forma mais eficiente.

A utilização do operador pipe permite criar sequências de comandos, enquanto ferramentas como `tee`, `sort`, `cut`, `grep` e `sed` facilitam tarefas de organização, pesquisa e transformação de dados.

## Arquivos do repositório

```text
aws-restart-laboratorio-247-trabalhar-com-comandos/
├── README.md
├── comandos.sh
└── .gitignore
```

O arquivo `comandos.sh` reúne os principais comandos praticados durante o laboratório.
