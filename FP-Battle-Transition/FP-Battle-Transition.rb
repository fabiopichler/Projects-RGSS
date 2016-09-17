#===============================================================================
# * * FP Battle Transition * *
#===============================================================================
# * Criado por: Fábio Pichler - http://fabiopichler.net
# * Licença: MIT License - http://fabiopichler.net/mit-license/
# * Versão: 1.1
# * Compatível com: RGSS3 (RPG Maker VX Ace)
# * Lançamento: 11/01/2014
# * Atualizado: 17/09/2016
# * Página Web: http://fabiopichler.net/rpg-maker/fp-battle-transition/
# * GitHub: https://github.com/fabiopichler/Projects-RGSS
#
#===============================================================================
# * * LICENÇA [The MIT License (MIT)] * *
#-------------------------------------------------------------------------------
# Copyright (c) 2014-2016 Fábio Pichler
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#===============================================================================
# * * Para que serve * *
#-------------------------------------------------------------------------------
# * Este script permite a alteração da imagem de "transição de batalha"
# (transição: Mapa => Batalha).
#
# * Poderá alterar a imagem durante a execução do jogo, apenas alterando
# o valor duma variável.
#
#===============================================================================
# * * Características * *
#-------------------------------------------------------------------------------
# * Compatibilidade: Boa
# * Imagem: As imagens devem ficar na pasta "Graphics\System"
# * Dificuldade: Fácil
# * Lag: Desprezível
# * Bug: Nenhum
#
#===============================================================================
# * * Modo de uso (Tutorial) * *
#-------------------------------------------------------------------------------
# * Use o comando "Controle de Variável" num evento, para trocar
# a "imagem de transição".
#
# * Cada valor definido na "Variável X", fará com que, uma imagem seja
# a "padrão" das batalhas.
#
#
# * * Nome das Imagens * *
#
# * A primeira imagem, deve ter apenas um "nome normal".
# Exemplo:
#        BattleStart.png
#
# * O restante das imagens, devem seguir o seguinte padrão:
#        (Nome) + (Underline) + (Número único) + (Extensão)
# Exemplo:
#        BattleStart_9.png
#
# * Outros Exemplos:
#        BattleStart.png
#        BattleStart_1.png
#        BattleStart_2.png
#        BattleStart_3.png
#        BattleStart_4.png
#
#
# * * Utilizando as variáveis * *
#
# * Se alterar o valor da "Variável X" pra zero, ou se mantiver inalterado de
# início (valor inicial é zero), a imagem chamada pelo script será a
# imagem com "nome normal".
# Exemplo:
#        BattleStart.png
#
# * Para usar outra imagem, basta alterar o valor da "Variável X". O valor da
# "Variável X" será o número da imagem.
#        Valor "3" na "Variável X", irá padronizar a imagem "BattleStart_3.png".
#
# * Outros Exemplos:
#        BattleStart.png    ("Variável X" com valor "zero")
#        BattleStart_1.png  ("Variável X" com valor "1")
#        BattleStart_2.png  ("Variável X" com valor "2")
#        BattleStart_3.png  ("Variável X" com valor "3")
#        BattleStart_4.png  ("Variável X" com valor "4")
#        BattleStart_6.jpg  ("Variável X" com valor "6")
#        BattleStart_9.jpg  ("Variável X" com valor "9")
#
#
module FPBT #Não mexa nesta linha
#===============================================================================
# * * Configuração * * [Alterações após o sinal de = (igualdade)]
#-------------------------------------------------------------------------------
  # * ID da Variável a ser usada. ("Variável X" do exemplo :)
  VAR = 1
  # * Nome padrão das imagens.
  IMG = "BattleStart" #Não inclua underline, número ou extensão.
#-------------------------------------------------------------------------------
# * * Fim da configuração * *
#===============================================================================

#===============================================================================
# * * Script * * Se alterar e estragar o script, o problema é seu :)
#-------------------------------------------------------------------------------
end

class Scene_Map < Scene_Base
  def perform_battle_transition
    if ($game_variables[FPBT::VAR] == 0)
      fpbt = FPBT::IMG
    else
      fpbt = FPBT::IMG + "_" + $game_variables[FPBT::VAR].to_s
    end

    Graphics.transition(60, "Graphics/System/" + fpbt, 100)
    Graphics.freeze
  end
end

#-------------------------------------------------------------------------------
# * * Fim do Script * *
#===============================================================================