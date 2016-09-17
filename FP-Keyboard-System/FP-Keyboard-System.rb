#===============================================================================
# * * FP Keyboard System * *
#===============================================================================
# * Criado por: Fábio Pichler - http://fabiopichler.net
# * Licença: MIT License - http://fabiopichler.net/mit-license/
# * Versão: 1.1.1
# * Compatível com: RGSS3 (RPG Maker VX Ace)
#                   RGSS2 (RPG Maker VX)
#                   RGSS  (RPG Maker XP)
# * Lançamento: 02/12/2014
# * Atualizado: 17/09/2016
# * Página Web: http://fabiopichler.net/rpg-maker/fp-keyboard-system/
# * GitHub: https://github.com/fabiopichler/Projects-RGSS
#
#===============================================================================
# * * LICENÇA (MIT License) * *
#-------------------------------------------------------------------------------
# The MIT License (MIT)
#
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
# * Este script aumenta a quantidade de teclas disponíveis para o RPG Maker.
#
# * É possível utilizar, praticamente todas as teclas disponíveis num
# teclado convencional de Desktop e de Notebook.
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
# * O script funciona por verificação de tecla pressionada, podem ser utilizadas
# condições em sistemas por eventos ou em outros scripts (Ruby/RGSS).
#
# * O modo de utilização é exatamente o mesmo do "Input.press?()". E terá a
# seguinte sintaxe:
#    FPKey.press?(Código da tecla) Equivalente a: Input.press?()
#    FPKey.trigger?(Código da tecla) Equivalente a: Input.trigger?()
#    FPKey.repeat?(Código da tecla) Equivalente a: Input.repeat?()
#
# * Se a tecla foi pressionada, retorna true (verdadeiro), caso contrário,
# retorna false (falso).
#
# * Exemplos:
#    if (FPKey.press?(FPKey::Enter))
#      # Executa alguma coisa, caso "Enter" seja pressionado.
#    end
#    if (FPKey.trigger?(FPKey::A))
#      # Executa alguma coisa, caso a tecla "A" seja pressionada.
#    end
#
#-------------------------------------------------------------------------------
#  Código das teclas   > Nome/Função da tecla
#-------------------------------------------------------------------------------
#  FPKey::A            > A
#  FPKey::B            > B
#  FPKey::C            > C
#  FPKey::D            > D
#  FPKey::E            > E
#  FPKey::F            > F
#  FPKey::G            > G
#  FPKey::H            > H
#  FPKey::I            > I
#  FPKey::J            > J
#  FPKey::K            > K
#  FPKey::L            > L
#  FPKey::M            > M
#  FPKey::N            > N
#  FPKey::O            > O
#  FPKey::P            > P
#  FPKey::Q            > Q
#  FPKey::R            > R
#  FPKey::S            > S
#  FPKey::T            > T
#  FPKey::U            > U
#  FPKey::V            > V
#  FPKey::W            > W
#  FPKey::X            > X
#  FPKey::Y            > Y
#  FPKey::Z            > Z
#  FPKey::Num0         > 0
#  FPKey::Num1         > 1
#  FPKey::Num2         > 2
#  FPKey::Num3         > 3
#  FPKey::Num4         > 4
#  FPKey::Num5         > 5
#  FPKey::Num6         > 6
#  FPKey::Num7         > 7
#  FPKey::Num8         > 8
#  FPKey::Num9         > 9
#  FPKey::Numpad0      > Numpad 0
#  FPKey::Numpad1      > Numpad 1
#  FPKey::Numpad2      > Numpad 2
#  FPKey::Numpad3      > Numpad 3
#  FPKey::Numpad4      > Numpad 4
#  FPKey::Numpad5      > Numpad 5
#  FPKey::Numpad6      > Numpad 6
#  FPKey::Numpad7      > Numpad 7
#  FPKey::Numpad8      > Numpad 8
#  FPKey::Numpad9      > Numpad 9
#  FPKey::F1           > F1
#  FPKey::F2           > F2
#  FPKey::F3           > F3
#  FPKey::F4           > F4
#  FPKey::F5           > F5
#  FPKey::F6           > F6
#  FPKey::F7           > F7
#  FPKey::F8           > F8
#  FPKey::F9           > F9
#  FPKey::F10          > F10
#  FPKey::F11          > F11
#  FPKey::F12          > F12
#  FPKey::F13          > F13
#  FPKey::F14          > F14
#  FPKey::F15          > F15
#  FPKey::Left         > Seta para esquerda
#  FPKey::Right        > Seta para direita
#  FPKey::Up           > Seta para cima
#  FPKey::Down         > Seta para baixo
#  FPKey::Escape       > Escape
#  FPKey::Pause        > Pause
#  FPKey::Enter        > Enter
#  FPKey::PrintScreen  > Print Screen
#  FPKey::Separator    > Separator
#  FPKey::Alt          > Alt
#  FPKey::LControl     > Control esquerdo
#  FPKey::LShift       > Shift esquerdo
#  FPKey::LMenu        > Menu esquerdo
#  FPKey::LSystem      > Tecla Windows da esquerda
#  FPKey::RControl     > Control direito
#  FPKey::RShift       > Shift direito
#  FPKey::RSystem      > Tecla Windows da direita
#  FPKey::RMenu        > Menu direito
#  FPKey::LBracket     > Tecla [
#  FPKey::RBracket     > Tecla ]
#  FPKey::SemiColon    > Tecla ;
#  FPKey::Comma        > Tecla ,
#  FPKey::Period       > Tecla .
#  FPKey::Quote        > Tecla '
#  FPKey::Slash        > Tecla /
#  FPKey::BackSlash    > Tecla \
#  FPKey::Tilde        > Tecla ~
#  FPKey::Dash         > Tecla -
#  FPKey::Space        > Space
#  FPKey::BackSpace    > Backspace
#  FPKey::Tab          > Tabulation (Tab)
#  FPKey::PageUp       > Page up
#  FPKey::PageDown     > Page down
#  FPKey::End          > End
#  FPKey::Home         > Home
#  FPKey::Insert       > Insert
#  FPKey::Delete       > Delete
#  FPKey::Add          > Tecla +
#  FPKey::Subtract     > Tecla -
#  FPKey::Multiply     > Tecla *
#  FPKey::Divide       > Tecla /
#
#===============================================================================
# * * Script * * Se alterar e estragar o script, o problema é seu :)
#-------------------------------------------------------------------------------

module FPKey
  A = 0x41            # The A key
  B = 0x42            # The B key
  C = 0x43            # The C key
  D = 0x44            # The D key
  E = 0x45            # The E key
  F = 0x46            # The F key
  G = 0x47            # The G key
  H = 0x48            # The H key
  I = 0x49            # The I key
  J = 0x4A            # The J key
  K = 0x4B            # The K key
  L = 0x4C            # The L key
  M = 0x4D            # The M key
  N = 0x4E            # The N key
  O = 0x4F            # The O key
  P = 0x50            # The P key
  Q = 0x51            # The Q key
  R = 0x52            # The R key
  S = 0x53            # The S key
  T = 0x54            # The T key
  U = 0x55            # The U key
  V = 0x56            # The V key
  W = 0x57            # The W key
  X = 0x58            # The X key
  Y = 0x59            # The Y key
  Z = 0x5A            # The Z key
  Num0 = 0x30         # The 0 key
  Num1 = 0x31         # The 1 key
  Num2 = 0x32         # The 2 key
  Num3 = 0x33         # The 3 key
  Num4 = 0x34         # The 4 key
  Num5 = 0x35         # The 5 key
  Num6 = 0x36         # The 6 key
  Num7 = 0x37         # The 7 key
  Num8 = 0x38         # The 8 key
  Num9 = 0x39         # The 9 key
  Numpad0 = 0x60      # The numpad 0 key
  Numpad1 = 0x61      # The numpad 1 key
  Numpad2 = 0x62      # The numpad 2 key
  Numpad3 = 0x63      # The numpad 3 key
  Numpad4 = 0x64      # The numpad 4 key
  Numpad5 = 0x65      # The numpad 5 key
  Numpad6 = 0x66      # The numpad 6 key
  Numpad7 = 0x67      # The numpad 7 key
  Numpad8 = 0x68      # The numpad 8 key
  Numpad9 = 0x69      # The numpad 9 key
  F1 = 0x70           # The F1 key
  F2 = 0x71           # The F2 key
  F3 = 0x72           # The F3 key
  F4 = 0x73           # The F4 key
  F5 = 0x74           # The F5 key
  F6 = 0x75           # The F6 key
  F7 = 0x76           # The F7 key
  F8 = 0x77           # The F8 key
  F9 = 0x78           # The F9 key
  F10 = 0x79          # The F10 key
  F11 = 0x7A          # The F11 key
  F12 = 0x7B          # The F12 key
  F13 = 0x7C          # The F13 key
  F14 = 0x7D          # The F14 key
  F15 = 0x7E          # The F15 key
  Left = 0x25         # Left arrow
  Right = 0x27        # Right arrow
  Up = 0x26           # Up arrow
  Down = 0x28         # Down arrow
  Escape = 0x1B       # The Escape key
  Pause = 0x13        # The Pause key
  Enter = 0x0D        # Enter Key
  PrintScreen = 0x2C  # Print Screen Key
  Separator = 0x6C    # Separator key
  Alt = 0x12          # The Alt key
  LControl = 0xA2     # The left Control key
  LShift = 0xA0       # The left Shift key
  LMenu = 0xA4        # The left Menu key
  LSystem = 0x5B      # The left OS specific key: window (Windows and Linux), apple (MacOS X), ...
  RControl = 0xA3     # The right Control key
  RShift = 0xA1       # The right Shift key
  RSystem = 0x5C      # The right OS specific key: window (Windows and Linux), apple (MacOS X), ...
  RMenu = 0xA5        # The right Menu key
  LBracket = 0xDB     # The [ key
  RBracket = 0xDD     # The ] key
  SemiColon = 0xBA    # The ; key
  Comma = 0xBC        # The , key
  Period = 0xBE       # The . key
  Quote = 0xDE        # The ' key
  Slash = 0xBF        # The / key
  BackSlash = 0xDC    # The \ key
  Tilde = 0xC0        # The ~ key
  Dash = 0xBD         # The - key
  Space = 0x20        # The Space key
  BackSpace = 0x08    # The Backspace key
  Tab = 0x09          # The Tabulation key
  PageUp = 0x21       # The Page up key
  PageDown = 0x22     # The Page down key
  End = 0x23          # The End key
  Home = 0x24         # The Home key
  Insert = 0x2D       # The Insert key
  Delete = 0x2E       # The Delete key
  Add = 0x6B          # The + key
  Subtract = 0x6D     # The - key
  Multiply = 0x6A     # The * key
  Divide = 0x6F       # The / key

  @trigger = false
  @currentKey = 0

  def self.getAKeyState(fpKey)
    Win32API.new("User32","GetAsyncKeyState","I","I").call(fpKey)
  end

  def self.press?(fpKey)
    (getAKeyState(fpKey) != 0)
  end

  def self.trigger?(fpKey)
    loop do
      if (@trigger)
        if (getAKeyState(@currentKey) == 0)
          @currentKey = 0
          @trigger = false
          return false if (getAKeyState(fpKey) == 0)
        else
          return false
        end
      else
        if (getAKeyState(fpKey) != 0)
          @currentKey = fpKey
          @trigger = true
          return true
        else
          return false
        end  
      end
    end
  end

  def self.repeat?(fpKey)
    (getAKeyState(fpKey) == -32767)
  end
end

#-------------------------------------------------------------------------------
# * * Fim do Script * *
#===============================================================================
