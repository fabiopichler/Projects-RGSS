#===============================================================================
# * * FP Demonstration Mode * *
#===============================================================================
# * Criado por: Fábio Pichler - http://fabiopichler.net
# * Licença: MIT License - http://fabiopichler.net/mit-license/
# * Versão: 1.1
# * Compatível com: RGSS3 (RPG Maker VX Ace)
# * Lançamento: 05/05/2014
# * Atualizado: 17/09/2016
# * Página Web: http://fabiopichler.net/rpg-maker/fp-demonstration-mode/
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
# * Este script permite a utilização de demonstrações do jogo, igual
# aos jogos de Vídeo Games. Esta demonstração, é nada mais que um jogo
# automático, onde o usuário não pode interferir nos acontecimentos,
# deve ter duração de segundos ou de alguns minutos e
# mostrar alguma(s) parte(s) de seu Jogo (projeto).
#
# * Para ver a demonstração, basta esperar X segundos, na tela do Menu Principal.
#
# * O script iniciará um mapa, após isso, o personagem e o ambiente
# deverão interagir automaticamente. Pra isso, use sistemas por Eventos
# com "Início Automático".
#
# * No final do Evento Geral que comanda o Personagem e algo a mais do ambiente,
# use o comando "Chamar Script" e adicione o seguinte código:
#      SceneManager.goto(Scene_Title)
# Este comando chama a tela de título, novamente.
#
# * Pode-se usar quantas demonstrações quiser, pode-se usá-las em sequência
# pré-definida ou aleatoriamente.
#
# * O tempo de espera só será válido, apartir da inatividade do usuário,
# ou seja, os X segundos só farão efeito, caso não aperte nenhum botão.
#
# * A cada vez que precionar alguma tecla (cima, direita, baixo, esquerda),
# o tempo será reiniciado.
#
# * Adicione um "Evento em Processo Paralelo" para tirar da demonstração
# e levar o usuário de volta ao Menu Inicial. Uma condição de pressionar
# tecla e o comando de Chamar Script, com o seguinte código:
#      SceneManager.goto(Scene_Title)
#
# * Para mais informações e exclarecimentos, dê uma olhada na Demo do Script.
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
# * Utilize o Módulo de Configurações, logo abaixo.
#
# * Para escoher os mapas a serem usados, deverá informar:
#  - ID do Mapa: Número de identificação do mapa;
#  - Coordenada X: Posição Horizontal de início;
#  - Coordenada Y: Posição Vertical de início.
#
# * Exemplo para um Mapa com ID 003 e coordenada de início (6 x 9) 
#      MapID = [3]
#      X =     [6]
#      Y =     [9]
#
# * Para usar vários Mapas, basta seguir a seguinte lógica:
#      MapID = [ID_Mapa_1,  ID_Mapa_2,  ID_Mapa_3,  ID_Mapa_4]
#      X =     [ X_Mapa_1,   X_Mapa_2,   X_Mapa_3,   X_Mapa_4]
#      Y =     [ Y_Mapa_1,   Y_Mapa_2,   Y_Mapa_3,   Y_Mapa_4]
#
# * Exemplo:
#  - Primeiro Mapa: ID = 004, X = 8 e Y = 2.
#  - Segundo Mapa: ID = 009, X = 3 e Y = 7.
#      MapID = [4, 9]
#      X =     [8, 3]
#      Y =     [2, 7]
#
# * Outro exemplo:
#      MapID = [18, 7, 14, 23]
#      X = [30, 12, 6, 48]
#      Y = [24, 34, 3, 2]
#
#
module FPDM #Não mexa nesta linha
#===============================================================================
# * * Configuração * * [Alterações após o sinal de = (igualdade)]
#-------------------------------------------------------------------------------
  # * Tempo de espera
  # Escolha o tempo de espera para iniciar a demonstração (em Segundos)
  # Recomendado: 20 ou mais
  Timeout = 10 #Segundos
  # * Aleatório
  # Para exibir aleatoriamente, escreva: true
  # Para seguir uma sequência pré definida: false
  Random = false
  # * Personagem transparente ao iniciar a demonstração?
  # Sim: true, Não: false
  Transparent = true
  # * ID dos Mapas usados
  # Escolha os IDs dos mapas. Exemplo: [8,3,18,35]
  MapID = [2,3]
  # * Coordenada X de início
  # Escolha as posições X de início em cada mapa. Exemplo: [3,14,16,8]
  X = [0,8]
  # * Coordenada Y de início
  # Escolha as posições Y de início em cada mapa. Exemplo: [6,6,0,12]
  Y = [6,12]
#-------------------------------------------------------------------------------
# * * Fim da configuração * *
#===============================================================================

#===============================================================================
# * * Script * * Se alterar e estragar o script, o problema é seu :)
#-------------------------------------------------------------------------------
  Wait = Timeout * 60
end

module DataManager
  @last_demo = -1

  def self.setup_game_demo
    if (FPDM::Random && FPDM::MapID.length > 1)
      loop do
        @fp_count = rand(FPDM::MapID.length)
        break if (@last_demo != @fp_count)
      end
	  
      @last_demo = @fp_count
    else
      fpmd_count = FPDM::MapID.length - 1
	  
      if (@fp_count == nil || @fp_count >= fpmd_count)
        @fp_count = 0
      else
        @fp_count += 1
      end
    end
	
    create_game_objects
    $game_party.setup_starting_members
    $game_map.setup(FPDM::MapID[@fp_count])
    $game_player.moveto(FPDM::X[@fp_count],FPDM::Y[@fp_count])
    $game_player.transparent = FPDM::Transparent
    $game_player.refresh
    Graphics.frame_count = 0
  end
end

class Scene_Title < Scene_Base
  @@fp_wait = 0
  alias fpmd_close_c_w close_command_window
  
  def update
    super
	
    if (Input.trigger?(:UP) || Input.trigger?(:RIGHT) || Input.trigger?(:DOWN) || Input.trigger?(:LEFT))
      @@fp_wait = 0
    else
      @@fp_wait += 1
    end
	
    if (@@fp_wait == FPDM::Wait)
      DataManager.setup_game_demo
      close_command_window
      fadeout_all
      $game_map.autoplay
      SceneManager.goto(Scene_Map)
    end
  end

  def close_command_window
    fpmd_close_c_w
    @@fp_wait = 0
  end
end

#-------------------------------------------------------------------------------
# * * Fim do Script * *
#===============================================================================