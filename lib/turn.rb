require 'deck.rb'
require 'card.rb'
require 'player.rb'

class Turn
 attr_reader :player , :type
  def initialize(player, type)
    @player = player.name
    @type = type
  end




end
