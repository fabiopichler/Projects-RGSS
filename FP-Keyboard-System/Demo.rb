#===============================================================================
# * * Script de demonstração e teste do FP Keyboard System * *
#===============================================================================
# * Criado por: Fábio Pichler  http://fabiopichler.net
# * Para: FP Keyboard System 1.1.X
# * Compatível com: RPG Maker VX Ace
#                   RPG Maker VX
#                   RPG Maker XP
# * Lançamento: 02/12/2014
# * Atualizado: 17/09/2016
# * Página Web: http://fabiopichler.net/rpg-maker/fp-keyboard-system/
# * GitHub: https://github.com/fabiopichler/Projects-RGSS
#
#===============================================================================
# * * Introdução * *
#-------------------------------------------------------------------------------
# * Este script serve para demonstrar o funcionamento do
# script FP Keyboard System.
#
# * Utilize as teclas de letras e espaço para escrever. Use Enter para proceguir.
#
#===============================================================================

info = Sprite.new
info.bitmap = Bitmap.new(544,416)
info.bitmap.draw_text(0,9,544,30,"FP Keyboard System",1)
info.bitmap.draw_text(0,40,544,30,"Escreva algumas palavras. Use Enter para seguir.",1)
info.bitmap.font.size = 18
info.bitmap.draw_text(0,380,544,30,"Copyright (c) 2015 Fábio Pichler",1)
sprite = Sprite.new
sprite.bitmap = Bitmap.new(544,416)
str = ""
loop do
  if FPKey.trigger?(FPKey::A)
    str += "A"
  elsif FPKey.trigger?(FPKey::B)
    str += "B"
  elsif FPKey.trigger?(FPKey::C)
    str += "C"
  elsif FPKey.trigger?(FPKey::D)
    str += "D"
  elsif FPKey.trigger?(FPKey::E)
    str += "E"
  elsif FPKey.trigger?(FPKey::F)
    str += "F"
  elsif FPKey.trigger?(FPKey::G)
    str += "G"
  elsif FPKey.trigger?(FPKey::H)
    str += "H"
  elsif FPKey.trigger?(FPKey::I)
    str += "I"
  elsif FPKey.trigger?(FPKey::J)
    str += "J"
  elsif FPKey.trigger?(FPKey::K)
    str += "K"
  elsif FPKey.trigger?(FPKey::L)
    str += "L"
  elsif FPKey.trigger?(FPKey::M)
    str += "M"
  elsif FPKey.trigger?(FPKey::N)
    str += "N"
  elsif FPKey.trigger?(FPKey::O)
    str += "O"
  elsif FPKey.trigger?(FPKey::P)
    str += "P"
  elsif FPKey.trigger?(FPKey::Q)
    str += "Q"
  elsif FPKey.trigger?(FPKey::R)
    str += "R"
  elsif FPKey.trigger?(FPKey::S)
    str += "S"
  elsif FPKey.trigger?(FPKey::T)
    str += "T"
  elsif FPKey.trigger?(FPKey::U)
    str += "U"
  elsif FPKey.trigger?(FPKey::V)
    str += "V"
  elsif FPKey.trigger?(FPKey::W)
    str += "W"
  elsif FPKey.trigger?(FPKey::X)
    str += "X"
  elsif FPKey.trigger?(FPKey::Y)
    str += "Y"
  elsif FPKey.trigger?(FPKey::Z)
    str += "Z"
  elsif FPKey.trigger?(FPKey::Space)
    str += " "
  elsif FPKey.repeat?(FPKey::BackSpace)
    if (str.length > 0)
      str[str.length-1] = ""
    end
  end
  sprite.bitmap.clear
  sprite.bitmap.draw_text(4,100,540,30,str)
  Graphics.update

  break if(FPKey.press?(FPKey::Enter))
end
info.bitmap.dispose
info.dispose
sprite.bitmap.dispose
sprite.dispose
