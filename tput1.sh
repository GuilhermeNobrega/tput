#!/bin/bash

function redraw(){
    altura=$(tput lines) # Linhas
    largura=$(tput cols) #colunas
    str="Linhas = $altura Colunas = $largura"
    length=${#str} #leitura do tamanho da string
    clear
    tput cup $((altura /2 )) $(((largura /2 ) - (length / 2))) # Mover o cursor para esse posição
    echo "$str"

}

trap redraw WINCH 
redraw
while true; do
    : # esses pontos significam nada, são nulos e retornam 0. Preciso deixar o script em execução, mas sem fazer nada dentro dele
    done

# comando trap é usado em Bash para especificar ações a serem executadas quando sinais específicos são recebidos pelo script
# WINCH (Window Change): WINCH é o sinal que o sistema operacional envia quando ocorre uma alteração no tamanho da janela 
#(por exemplo, quando o usuário redimensiona a janela do terminal).

: '
$((altura / 2)): Isso avalia a expressão aritmética altura / 2 e atribui o resultado à posição vertical (linha) do cursor.

$(((largura / 2) - (length / 2))): Aqui, há uma expressão mais complexa. Vamos quebrar:

((largura / 2) - (length / 2)): Isso calcula a posição horizontal (coluna) do cursor. largura / 2 é a metade da largura do terminal, e length / 2 é a metade do comprimento da string. A diferença entre esses valores resulta no deslocamento necessário para centralizar a string no terminal.
Portanto, o uso de parênteses duplos $((...)) é uma construção específica do Bash para avaliar expressões aritméticas dentro de um contexto de substituição de variáveis
'
