require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

class Start
  attr_reader :game

  def initialize(turn)
    @game = turn
  end

  def start(user_input_GO)
    if user_input_GO == 'GO'



      puts 'This works'
    end
  end

end
