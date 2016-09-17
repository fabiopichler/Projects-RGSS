#===============================================================================
# * * FP Battle Transition * *
#===============================================================================
# * Criado por: F�bio Pichler - http://fabiopichler.net
# * Licen�a: MIT License - http://fabiopichler.net/mit-license/
# * Vers�o: 1.1
# * Compat�vel com: RGSS3 (RPG Maker VX Ace)
# * Lan�amento: 11/01/2014
# * Atualizado: 17/09/2016
# * P�gina Web: http://fabiopichler.net/rpg-maker/fp-battle-transition/
# * GitHub: https://github.com/fabiopichler/Projects-RGSS
#
#===============================================================================
# * * LICEN�A [The MIT License (MIT)] * *
#-------------------------------------------------------------------------------
# Copyright (c) 2014-2016 F�bio Pichler
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
# * Este script permite a altera��o da imagem de "transi��o de batalha"
# (transi��o: Mapa => Batalha).
#
# * Poder� alterar a imagem durante a execu��o do jogo, apenas alterando
# o valor duma vari�vel.
#
#===============================================================================
# * * Caracter�sticas * *
#-------------------------------------------------------------------------------
# * Compatibilidade: Boa
# * Imagem: As imagens devem ficar na pasta "Graphics\System"
# * Dificuldade: F�cil
# * Lag: Desprez�vel
# * Bug: Nenhum
#
#===============================================================================
# * * Modo de uso (Tutorial) * *
#-------------------------------------------------------------------------------
# * Use o comando "Controle de Vari�vel" num evento, para trocar
# a "imagem de transi��o".
#
# * Cada valor definido na "Vari�vel X", far� com que, uma imagem seja
# a "padr�o" das batalhas.
#
#
# * * Nome das Imagens * *
#
# * A primeira imagem, deve ter apenas um "nome normal".
# Exemplo:
#        BattleStart.png
#
# * O restante das imagens, devem seguir o seguinte padr�o:
#        (Nome) + (Underline) + (N�mero �nico) + (Extens�o)
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
# * * Utilizando as vari�veis * *
#
# * Se alterar o valor da "Vari�vel X" pra zero, ou se mantiver inalterado de
# in�cio (valor inicial � zero), a imagem chamada pelo script ser� a
# imagem com "nome normal".
# Exemplo:
#        BattleStart.png
#
# * Para usar outra imagem, basta alterar o valor da "Vari�vel X". O valor da
# "Vari�vel X" ser� o n�mero da imagem.
#        Valor "3" na "Vari�vel X", ir� padronizar a imagem "BattleStart_3.png".
#
# * Outros Exemplos:
#        BattleStart.png    ("Vari�vel X" com valor "zero")
#        BattleStart_1.png  ("Vari�vel X" com valor "1")
#        BattleStart_2.png  ("Vari�vel X" com valor "2")
#        BattleStart_3.png  ("Vari�vel X" com valor "3")
#        BattleStart_4.png  ("Vari�vel X" com valor "4")
#        BattleStart_6.jpg  ("Vari�vel X" com valor "6")
#        BattleStart_9.jpg  ("Vari�vel X" com valor "9")
#
#
module FPBT #N�o mexa nesta linha
#===============================================================================
# * * Configura��o * * [Altera��es ap�s o sinal de = (igualdade)]
#-------------------------------------------------------------------------------
  # * ID da Vari�vel a ser usada. ("Vari�vel X" do exemplo :)
  VAR = 1
  # * Nome padr�o das imagens.
  IMG = "BattleStart" #N�o inclua underline, n�mero ou extens�o.
#-------------------------------------------------------------------------------
# * * Fim da configura��o * *
#===============================================================================

#===============================================================================
# * * Script * * Se alterar e estragar o script, o problema � seu :)
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