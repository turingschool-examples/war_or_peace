require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game

  def start
    until @lets_go == 'GO'
      print "Please type 'Go' to continue..."
      print " >"
      @lets_go = gets.chomp.upcase
    end
  end

end
