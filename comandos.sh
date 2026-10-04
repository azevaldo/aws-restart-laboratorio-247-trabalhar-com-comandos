#!/bin/bash

# AWS re/Start - Laboratório 247

# Trabalhar com Comandos

#

# Este arquivo reúne os principais comandos praticados durante o laboratório.

# Ele serve como documentação e não deve necessariamente ser executado

# inteiro de uma única vez.

#

# A conexão com a instância foi realizada no Windows utilizando

# PuTTY e a chave labsuser.ppk.

# ==========================================================

# TAREFA 2 - TEE

# ==========================================================

# Exibe o diretório atual.

pwd

# Envia a saída do hostname para o tee.

# O resultado é exibido no terminal e gravado em file1.txt.

hostname | tee file1.txt

# Lista os arquivos do diretório atual para verificar

# se file1.txt foi criado.

ls

# ==========================================================

# TAREFA 3 - SORT E PIPE

# ==========================================================

# Cria o arquivo test.csv.

# Depois de executar o comando, digite as linhas abaixo:

#

# Factory, 1, Paris

# Store, 2, Dubai

# Factory, 3, Brasilia

# Store, 4, Algiers

# Factory, 5, Tokyo

#

# Pressione CTRL+D para finalizar a entrada.

cat > test.csv

# Ordena as linhas do arquivo test.csv.

sort test.csv

# Utiliza o pipe para direcionar a saída para o grep.

# O objetivo do exercício é localizar o padrão Paris.

find | grep Paris test.csv

# Verifica os arquivos existentes no diretório.

ls

# ==========================================================

# TAREFA 4 - CUT

# ==========================================================

# Cria o arquivo cities.csv.

# Digite:

#

# Dallas, Texas

# Seattle, Washington

# Los Angeles, California

# Atlanta, Georgia

# New York, New York

#

# Pressione CTRL+D para finalizar.

cat > cities.csv

# Extrai o primeiro campo de cada linha.

# -d ',' define a vírgula como delimitador.

# -f 1 seleciona o primeiro campo.

cut -d ',' -f 1 cities.csv

# ==========================================================

# DESAFIO - SED

# ==========================================================

# Substitui a primeira vírgula por um ponto em cada linha

# de cities.csv.

#

# O arquivo original não é alterado; o resultado é exibido

# no terminal.

sed 's/,/./' cities.csv

# Substitui a primeira vírgula por um ponto em cada linha

# de test.csv.

sed 's/,/./' test.csv

# ==========================================================

# CONCEITOS

# ==========================================================

# Pipe:

# comando1 | comando2

#

# Envia a saída do primeiro comando para o segundo.

# Tee:

# comando | tee arquivo.txt

#

# Exibe a saída e também grava em um arquivo.

# Sort:

# sort arquivo.csv

#

# Ordena as linhas do arquivo.

# Cut:

# cut -d ',' -f 1 arquivo.csv

#

# Extrai o primeiro campo separado por vírgula.

# Sed:

# sed 's/,/./' arquivo.csv

#

# Substitui a primeira vírgula por um ponto em cada linha.

# IMPORTANTE:

# Este arquivo documenta os comandos praticados no laboratório.

# Alguns comandos, como cat > arquivo, são interativos e exigem

# entrada manual antes de continuar.
