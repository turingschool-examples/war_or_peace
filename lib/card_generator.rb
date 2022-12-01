require './lib/card.rb'
require './lib/deck.rb'



class CardGenerator

  def initialize(filename)
    @filename = filename 
    @file = File.open("./lib/#{filename}", "r")
  end

  

end