#===============================================================================
# * * FP Battle Results * *
#===============================================================================
# * Criado por: Fábio Pichler - http://fabiopichler.net
# * Licença: MIT License - http://fabiopichler.net/mit-license/
# * Versão: 1.3.0
# * Compatível com: RGSS3 (RPG Maker VX Ace)
# * Lançamento: 11/03/2013
# * Atualizado: 17/09/2016
# * Página Web: http://fabiopichler.net/rpg-maker/fp-battle-results/
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
# * Este Script modifica a tela de "resultado da batalha", deixando-o
# mais personalizável.
#
#===============================================================================
# * * Características * *
#-------------------------------------------------------------------------------
# * Resoluções Compatíveis: Qualquer resolução de tela
# * Pasta das imagens: As imagens devem ficar na pasta "Graphics\System"
# * Pasta dos sons: Os áudios devem ficar na pasta "Audio\SE"
# * Compatibilidade: Boa
# * Dificuldade: Fácil
# * Personalizável: Sim
# * Lag: Desprezível
# * Bug: Nenhum conhecido
#
#===============================================================================
# * * Modo de uso (Tutorial) * *
#-------------------------------------------------------------------------------
# * Coloque este script acima do Main.
# * Configure o script, conforme as necessidades.
# * Coloque as imagens de fundo na pasta "Graphics\System"
#
module FPBR #Não mexa nesta linha
#===============================================================================
# * * Configuração * * [Alterações após o sinal de = (igualdade)]
#-------------------------------------------------------------------------------
  #-----------------------------
  # * * Configuração Geral * *
  #-----------------------------
  # * Nome da imagem de fundo que cobrirá toda tela (ficará por trás de tudo).
  # Para não exibir um fundo, deixe assim: ""  *Exemplo: BACKGROUND_A = ""
  BACKGROUND_A = "BattleResult_A"
  # * Escolha os textos que aparecerão na tela.
  #        Resultado   Experiência   Dinheiro      Itens
  TEXT = ["RESULTADO","Experiência","Dinheiro","Itens Obtidos"]
  # * Nome da fonte do texto.
  FONT_NAME = "Arial"
  # * Tamanho da fonte do texto.
  FONT_SIZE = 21
  # * Cor para o texto.
  # Ajuste as cores na ordem [Vermelho,Verde,Azul,Intensidade]
  TEXT_COLOR_A = [0,0,0,255]
  # * Cor para o resultado.
  # Ajuste as cores na ordem [Vermelho,Verde,Azul,Intensidade]
  TEXT_COLOR_B = [0,0,255,255]
  # * Habilitar som ao "pressionar tecla"?
  # Use true ou false (true = sim, false = não)
  PRESS_KEY_SE_TRUE = true
  # * Arquivo de áudio para "pressionar tecla".
  PRESS_KEY_SE = "Heal1"
  #---------------------------------------------------
  # * * Configuração para "Janela de Resultados" * *
  #---------------------------------------------------
  # * Nome da imagem de fundo para os resultados.
  BACKGROUND_B = "BattleResult_B"
  # * Texto para mostrar que ganhou mais itens do que aparece na tela.
  # Caso tenha ganhado 11 itens ou mais, uma mensagem informará quantos foram.
  # Os caracteres "%i" serão substituídos pelo número de itens restantes.
  TEXT_B = "Mais %i itens"
  # * Tempo de espera para aparecer o plano de fundo dos resultados.
  # Tempo em Frames, 60 frames = 1 segundo
  BACKGROUND_WAIT = 20
  # * Tempo de espera, para que, cada resultado, apareça na tela.
  RESULT_NAME_WAIT = 40
  # * Habilitar som reproduzido quando, cada resultado, aparecer na tela?
  # Use true ou false (true = sim, false = não)
  RESULT_SE_TRUE = true
  # * Arquivo de áudio reproduzido quando, cada resultado, aparecer na tela.
  RESULT_SE = "Blow4"
  #----------------------------------------------------
  # * * Configuação para "Janela de Itens Ganhos" * *
  #----------------------------------------------------
  # * Nome da imagem de fundo para os itens ganhos.
  BACKGROUND_C = "BattleResult_C"
  # * Tempo de espera para aparecer a janela de itens.
  BACKGROUND_WAIT_B = 30
  # * Tempo de espera para aparecer o primeiro item da lista.
  ITEM_NAME_WAIT_A = 20
  # * Tempo de espera para que, cada nome de itens ganhos, apareçam na tela.
  ITEM_NAME_WAIT_B = 10
  # * Habilitar audio para os "nomes dos itens"?
  # Use true ou false (true = sim, false = não)
  ITEM_SE_TRUE = true
  # Nome do arquivo de audio para os "nomes dos itens"
  ITEM_SE = "Blow3"
#-------------------------------------------------------------------------------
# * * Fim da configuração * *
#===============================================================================

#===============================================================================
# * * Script * * Se alterar e estragar o script, o problema é seu :)
#-------------------------------------------------------------------------------
end

module BattleManager
  def self.process_victory
    play_battle_end_me
    replay_bgm_and_bgs
    battle_result = Scene_BattleResult.new
    gain_exp
    SceneManager.return
    battle_end(0)
    Graphics.fadeout(30)
    battle_result.dispose_background
    return true
  end
end

class Scene_BattleResult
  include FPBR

  def initialize
    @item_amount = 0
    @width = Graphics.width
    @height = Graphics.height
    
    if $game_troop.gold_total > 0
      $game_party.gain_gold($game_troop.gold_total)
    end
    
    $game_troop.make_drop_items.each do |item|
      $game_party.gain_item(item, 1)
      @item_amount += 1
    end
    
    create_background unless FPBR::BACKGROUND_A.empty?
    display_results
    display_items if @item_amount > 0
  end

  def create_background
    @fpbr_background = Sprite.new
    @fpbr_background.bitmap = Cache.system(BACKGROUND_A)
    @fpbr_background.x = (@width - @fpbr_background.bitmap.width) / 2
    @fpbr_background.y = (@height - @fpbr_background.bitmap.height) / 2
    @fpbr_background.z = 150
  end

  def dispose_background
    return if @fpbr_background.nil?
    @fpbr_background.bitmap.dispose
    @fpbr_background.dispose
  end

  def display_results
    Graphics.wait(BACKGROUND_WAIT)
    
    sprite_bg = Sprite.new
    sprite_bg.bitmap = Cache.system(BACKGROUND_B)
    sprite_bg.x = (@width - sprite_bg.bitmap.width) / 2
    sprite_bg.y = (@height - sprite_bg.bitmap.height) / 2
    sprite_bg.z = 240
    
    fp_values = [$game_troop.exp_total, $game_troop.gold_total, @item_amount]
    pos_x = sprite_bg.x + 30
    pos_y = sprite_bg.y + 122
    
    sprite = create_sprite
    sprite.bitmap.font.color = Color.new(TEXT_COLOR_A[0],TEXT_COLOR_A[1],TEXT_COLOR_A[2],TEXT_COLOR_A[3])
    sprite.bitmap.draw_text(0, sprite_bg.y + 52, @width, 30,TEXT[0], 1)

    for i in 1 .. 3
      sprite.bitmap.draw_text(pos_x, pos_y, 300, 30, TEXT[i], 0)
      pos_y += 65
    end

    sprite.bitmap.font.color = Color.new(TEXT_COLOR_B[0],TEXT_COLOR_B[1],TEXT_COLOR_B[2],TEXT_COLOR_B[3])
    pos_x = sprite_bg.x + 110
    pos_y = sprite_bg.y + 122
    
    for i in 0 .. 2
      Graphics.wait(RESULT_NAME_WAIT)
      Audio.se_play('Audio/SE/' + RESULT_SE) if RESULT_SE_TRUE
      sprite.bitmap.draw_text(pos_x, pos_y, 150, 30, fp_values[i], 2)
      pos_y += 65
    end
    
    loop do
      Graphics.update
      Input.update
      break if (Input.trigger?(:C) or Input.trigger?(:B))
    end
    
    Audio.se_play('Audio/SE/' + PRESS_KEY_SE) if PRESS_KEY_SE_TRUE
    Graphics.wait(5)
    
    sprite_bg.bitmap.dispose
    sprite_bg.dispose
    sprite.bitmap.dispose
    sprite.dispose
  end

  def display_items
    Graphics.wait(BACKGROUND_WAIT_B)
    
    item_bg = Sprite.new
    item_bg.bitmap = Cache.system(BACKGROUND_C)
    item_bg.x = (@width - item_bg.bitmap.width) / 2
    item_bg.y = (@height - item_bg.bitmap.height) / 2
    item_bg.z = 240
    
    sprite = create_sprite()
    sprite.bitmap.font.color = Color.new(TEXT_COLOR_A[0],TEXT_COLOR_A[1],TEXT_COLOR_A[2],TEXT_COLOR_A[3])
    sprite.bitmap.draw_text(0,item_bg.y + 15,@width,30,TEXT[3],1)
    Graphics.wait(ITEM_NAME_WAIT_A)
    sprite.bitmap.font.color = Color.new(TEXT_COLOR_B[0],TEXT_COLOR_B[1],TEXT_COLOR_B[2],TEXT_COLOR_B[3])
    
    pos_y = item_bg.y + 45
    fp_value = ""
    
    for item in 0 .. @item_amount - 1
      Audio.se_play('Audio/SE/' + ITEM_SE) if ITEM_SE_TRUE
      
      if (item < 9)
        fp_value = $game_troop.make_drop_items[item].name
      else
        fp_value = sprintf(TEXT_B, @item_amount - 9)
      end
      
      sprite.bitmap.draw_text(0, pos_y, @width, 30, fp_value, 1)
      Graphics.wait(ITEM_NAME_WAIT_B)
      pos_y += 30
      
      break if (item > 8)
    end
    
    loop do
      Graphics.update
      Input.update
      break if (Input.trigger?(:C) or Input.trigger?(:B))
    end
    
    Audio.se_play('Audio/SE/' + PRESS_KEY_SE) if PRESS_KEY_SE_TRUE
    Graphics.wait(5)
    
    item_bg.bitmap.dispose
    item_bg.dispose
    sprite.bitmap.dispose
    sprite.dispose
  end
  
  def create_sprite
    sprite = Sprite.new
    sprite.bitmap = Bitmap.new(@width, @height)
    sprite.z = 250
    sprite.bitmap.font.name = FONT_NAME
    sprite.bitmap.font.size = FONT_SIZE
    sprite.bitmap.font.outline = false
    sprite.bitmap.font.bold = false
    sprite.bitmap.font.shadow = false
    sprite
  end
end

class Scene_Battle < Scene_Base
  alias fpbr_refresh_status refresh_status
  def refresh_status
    fpbr_refresh_status
    @status_window.close if $game_troop.all_dead?
  end
end

#-------------------------------------------------------------------------------
# * * Fim do Script * *
#===============================================================================