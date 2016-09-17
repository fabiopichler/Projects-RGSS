#===============================================================================
# * * FP Game End * *
#===============================================================================
# * Criado por: Fábio Pichler - http://fabiopichler.net
# * Licença: MIT License - http://fabiopichler.net/mit-license/
# * Versão: 1.1
# * Compatível com: RGSS3 (RPG Maker VX Ace)
# * Lançamento: 17/10/2013
# * Atualizado: 17/09/2016
# * Página Web: http://fabiopichler.net/rpg-maker/fp-game-end/
# * GitHub: https://github.com/fabiopichler/Projects-RGSS
#
#===============================================================================
# * * LICENÇA [The MIT License (MIT)] * *
#-------------------------------------------------------------------------------
# Copyright (c) 2013-2016 Fábio Pichler
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
# * Este Script adiciona a possibilidade de manter valores ativos em variáveis
# e Switches, após o final do jogo.
# * Isto fará com que apenas as variáveis e Switches escolhidas, fiquem ativas.
#
# * Com isso, poderá criar novos sistemas, como:
# - Bônus por alta pontuação na partida anterior;
# - Informações sobre quantidade de vezes que completou o jogo;
# - Manter dinheiro após completar o jogo;
# - E muito mais.
#
#===============================================================================
# * * Características * *
#-------------------------------------------------------------------------------
# * Compatibilidade: Boa
# * Dificuldade: Fácil/Médio
# * Lag: Desprezível
# * Bug: Nenhum conhecido
#
#===============================================================================
# * * Modo de uso (Tutorial) * *
#-------------------------------------------------------------------------------
# * Para chamar a tela de Fim de Jogo, use o comando de "Chamar Script",
# e insira o seguinte código:
#       SceneManager.goto(Scene_GameEnd)
#
# * Escolha nas configurações abaixo, as variáveis ou switches, que
# deseja manter o valor.
#
module FPGE #Não mexa nesta linha
#===============================================================================
# * * Configuração * * [Alterações após o sinal de = (igualdade)]
#-------------------------------------------------------------------------------
  # * Escolha as variáveis que terão seu valor mantido.
  # Exemplo: Var = [2,5,10,11,30]
  Var = [2,5,10]
  # * Escolha as switches que terão seu valor mantido, sendo true ou false.
  # Exemplo: Switches = [3,6,10,24,33]
  Switches = [3,6,10]
#-------------------------------------------------------------------------------
# * * Fim da configuração * *
#===============================================================================

#===============================================================================
# * * Script * * Se alterar e estragar o script, o problema é seu :)
#-------------------------------------------------------------------------------
end

class Scene_GameEnd < Scene_Base
  def start
    super
    play_gameover_music
    fadeout_frozen_graphics
    create_background
  end

  def terminate
    super
    dispose_background
  end

  def update
    super
    goto_newgame if Input.trigger?(:C)
  end

  def perform_transition
    Graphics.transition(120)
  end

  def play_gameover_music
    RPG::BGM.stop
    RPG::BGS.stop
    $data_system.gameover_me.play
  end

  def fadeout_frozen_graphics
    Graphics.transition(60)
    Graphics.freeze
  end

  def create_background
    @sprite = Sprite.new
    @sprite.bitmap = Cache.system(FPGE::IMG)
  end

  def dispose_background
    @sprite.bitmap.dispose
    @sprite.dispose
  end

  def goto_newgame
    save_value
    DataManager.setup_new_game
    fadeout_all
    $game_map.autoplay
    SceneManager.goto(Scene_Map)
    return_value
  end

  def save_value
    fpge = 0
    @var_fpge = Array.new
	
    for value in FPGE::Var
      @var_fpge[fpge] = $game_variables[value]
      fpge += 1
    end
	
    fpge = 0
    @swit_fpge = Array.new
	
    for value in FPGE::Switches
      @swit_fpge[fpge] = $game_switches[value]
      fpge += 1
    end
  end

  def return_value
    fpge = 0
	
    for value in FPGE::Var
      $game_variables[value] = @var_fpge[fpge]
      fpge += 1
    end
	
    fpge = 0
	
    for value in FPGE::Switches
      $game_switches[value] = @swit_fpge[fpge]
      fpge += 1
    end
  end
end

#-------------------------------------------------------------------------------
# * * Fim do Script * *
#===============================================================================