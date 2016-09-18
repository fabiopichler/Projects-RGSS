#===============================================================================
# * * FP Fixed Start * *
#===============================================================================
# * Criado por: Fábio Pichler - http://fabiopichler.net
# * Licença: MIT License - http://fabiopichler.net/mit-license/
# * Versão: 1.3
# * Compatível com: RGSS3 (RPG Maker VX Ace)
# * Lançamento: 05/06/2014
# * Atualizado: 18/09/2016
# * Página Web: http://fabiopichler.net/rpg-maker/fp-fixed-start/
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
# * Este script faz com que o jogo sempre inicie num lugar fixo (na hora
# de carregar o jogo salvo), independente de onde foi salvo.
#
# * O programador pode definir quantos lugares quiser.
#
# * Quando o jogador estiver num determinado ponto do jogo, basta alterar
# o valor duma "Variável X", através do comando "Controle de Variável" (no
# sistema de eventos) para que o local de início seja alterado.
#
#===============================================================================
# * * Características * *
#-------------------------------------------------------------------------------
# * Compatibilidade: Boa
# * Dificuldade: Médio
# * Lag: Desprezível
# * Bug: Nenhum conhecido
#
#===============================================================================
# * * Modo de uso (Tutorial) * *
#-------------------------------------------------------------------------------
#----------------------------------------------------------------------
# * Usando o Script
#----------------------------------------------------------------------
# * Geral
#------------------------------------------------------
# * Para usar o script, basta escolher uma "Variável X" do sistema de eventos,
# adicionar o ID desta variável X nas configurações do script e alterar
# o valor desta variável através do comando "Controle de Variável". Caso use
# um único local, não será preciso o uso duma "Variável X".
#
#------------------------------------------------------
# * Apartir de Sistemas por Eventos ou outros Scripts
#------------------------------------------------------
# Obs.: Ambos os comando fazem a mesma função que: "DataManager.save_game(0)"
# ou "DataManager.load_game(0)", porém com mais recursos.
#
# Obs.2: O comando "FPManager.load_game" é obrigatório para o script funcionar
# atravéz de Sistemas por Eventos.
#
# * * Use o comando de "Chamar Script" e use:
#
# * Para Carregar o jogo:
#       - Comando: FPManager.load_game(0,false)
# Onde:
#       - 0 (zero): Este é o número do Slot em que o jogo será carregado, este
# valor é opcional, mas caso não definido, será zero. Para carregar o
# jogo em outro Slot, basta alterar o número para: 1, 2, 3, 4, etc...
#       - false: Este argumento é opcional. Caso escreva "true" (sem aspas)
# fará um "Fade Out", após o carregamento do jogo. Caso não escreva nada, ou
# escreva "false", não será realizado um Fade Out. Para utilizar este segundo
# argumento, será obrigatório utilizar o primeiro, que no caso é zero ou outro
# número.
#
# * Para Salvar o Jogo:
# Obs.: O comando "FPManager.save_game" é opcional, caso queira,
# poderá usar: "DataManager.save_game(0)", normalmente.
#
#       - Comando: FPManager.save_game(0)
# Onde:
#       - 0 (zero): É o número do Slot em que o jogo será Salvo, este
# valor é opcional, mas caso não definido, será zero. Para salvar o
# jogo em outro Slot, basta alterar o número para: 1, 2, 3, 4, etc...
#
#----------------------------------------------------------------------
# * Configurando o Script
#----------------------------------------------------------------------
# * Utilize o Módulo de Configurações, logo abaixo.
#
# * Para escoher os mapas a serem usados, deverá informar:
#  - ID do Mapa: Número de identificação do mapa;
#  - Coordenada X: Posição Horizontal de início;
#  - Coordenada Y: Posição Vertical de início.
#
# * Exemplo para um Mapa com ID 003 e coordenada de início (6 x 9)
# Neste caso, não é preciso usar uma "Variável X".
#      MapID = [3]
#      X =     [6]
#      Y =     [9]
#
# * Para usar vários Mapas, basta seguir a seguinte lógica:
# O primeiro número de cada lista, é usado para o primeiro local de início,
# que é "chamado" pelo valor zero ou 1 na "Variável X".
# Se alterar o valor da Variável X para 2, usará o segundo valor de cada
# lista e iniciará no segundo local.
# Se alterar o valor da Variável X para 3, usará o terceiro valor
# de cada lista e iniciará no terceiro local.
# E assim por diante... Veja:
#
# A Variável X terá:   Valor 1,       Valor 2,       Valor 3,       Valor 4
#        MapID = [ID_do_Mapa_1,  ID_do_Mapa_2,  ID_do_Mapa_3,  ID_do_Mapa_4]
#        X =     [ X_do_Mapa_1,   X_do_Mapa_2,   X_do_Mapa_3,   X_do_Mapa_4]
#        Y =     [ Y_do_Mapa_1,   Y_do_Mapa_2,   Y_do_Mapa_3,   Y_do_Mapa_4]
#
#--------------------------------------------------------------------
# * Exemplos
#--------------------------------------------------------------------
# * Exemplo 1:
#  - Primeiro Mapa: ID = 004, X = 8 e Y = 2, Valor da sua Variável X é 1.
#  - Segundo Mapa: ID = 019, X = 3 e Y = 17, Valor da sua Variável X é 2.
#      MapID = [4, 19]
#      X =     [8, 3]
#      Y =     [2, 17]
#
# * Exemplo 2:
#      MapID = [18, 7, 14, 23]
#      X =     [30, 12, 6, 48]
#      Y =     [24, 34, 3, 2]
# Neste exemplo, se você deixar o valor padrão (zero) ou 1 na Variável X,
# você usará o início com as seguintes coordenadas:
#      Mapa: 18 com coordenada X: 30 e coordenada Y: 24
# Se alterar o valor da Variável X para 3, usará o início nas seguintes
# coordenadas:
#      Mapa: 14 com coordenada X: 6 e coordenada Y: 3
#
module FPFS #Não mexa nesta linha
#===============================================================================
# * * Configuração * * [Alterações após o sinal de = (igualdade)]
#-------------------------------------------------------------------------------
  #----------------------------------------------------------------
  # * Configurações Gerais *
  #----------------------------------------------------------------
  # * * ID da Variável Usada * *
  # Escolha o ID da Variável que for utilizar para alternar entre lugares
  # de início. Se utilizar um único local de início, coloque um zero,
  # assim: "Var = 0" (sem aspas). Desta forma, não "gastará" mais uma variável.
  Var = 2
  # * * Modo Normal * *
  # Escolha o ID duma Switch para desativar temporariamente o script. Isso
  # poderá ser útil para criar saves normais em Masmoras, por exemplo.
  # Ative a Switch para desativar o efeito do Script. Se não usar isso,
  # deixe zero.
  Normal = 0
  # * * ID dos Mapas usados * *
  # Escolha os IDs dos mapas. Exemplo: [8,3,18,35]
  MapID = [1,1,1]
  # * * Coordenada X de início * *
  # Escolha as posições X de início em cada mapa. Exemplo: [3,14,16,8]
  X = [2,13,11]
  # * * Coordenada Y de início * *
  # Escolha as posições Y de início em cada mapa. Exemplo: [6,6,0,12]
  Y = [2,2,10]
  #----------------------------------------------------------------
  # * Configurações para o uso em Eventos, deste jeito:
  # FPManager.load_game() ou FPManager.save_game()
  #----------------------------------------------------------------
  # * * Erro ao Carrear ou Salvar * *
  # Escolha o ID duma Switch para ser ativada, quando não for possível
  # salvar ou carregar o jogo. Útil para mostrar mensagens ou rodar condições
  # de eventos. Também será retornado um erro, caso o usuário tentar carregar
  # um Slot que não existe.
  # Obs.: Após o uso deste recurso, é preciso desativar a Switch por Evento.
  # Se não usar isso, deixe zero.
  Error = 0
  # * * Sons ao Salvar ou Carregar * *
  # Escolha se deseja ativar os sons de Carregar, Salvar ou Erro. Caso queira
  # deixar somente o som de erro, por exemplo, pode desativar os outros no
  # Banco de Dados, na guia Sistema.
  # Para ativar, deixe: true, para desativar, deixe: false
  Sounds = true
#-------------------------------------------------------------------------------
# * * Fim da configuração * *
#===============================================================================

#===============================================================================
# * * Script * * Se alterar e estragar o script, o problema é seu :)
#-------------------------------------------------------------------------------
end

module FPManager
  def self.setup_map
    if (FPFS::Var == 0)
      fpifc = 0
    else
      fpifc = $game_variables[FPFS::Var]-1
    end
    
    $game_map.setup(FPFS::MapID[fpifc])
    $game_player.moveto(FPFS::X[fpifc],FPFS::Y[fpifc])
  end
  
  def self.save_game(fp_index = 0)
    if (DataManager.save_game(fp_index))
      Sound.play_save if FPFS::Sounds
    else
      Sound.play_buzzer if FPFS::Sounds
      $game_switches[FPFS::Error] = true if FPFS::Error > 0
    end
  end
  
  def self.load_game(fp_index = 0, fp_fade = false)
    if (DataManager.load_game(fp_index))
      if (FPFS::Normal > 0)
        setup_map unless $game_switches[FPFS::Normal]
      else
        setup_map
      end
      
      Sound.play_load if FPFS::Sounds
      Scene_Base.new.fadeout_all if fp_fade
      $game_system.on_after_load
      SceneManager.goto(Scene_Map)
    else
      Sound.play_buzzer if FPFS::Sounds
      $game_switches[FPFS::Error] = true if FPFS::Error > 0
    end
  end
end

class Scene_Load < Scene_File
  alias fpifc_on_load_s on_load_success
  
  def on_load_success
    if (FPFS::Normal > 0)
      FPManager.setup_map unless $game_switches[FPFS::Normal]
    else
      FPManager.setup_map
    end
    
    fpifc_on_load_s
  end
end

#-------------------------------------------------------------------------------
# * * Fim do Script * *
#===============================================================================