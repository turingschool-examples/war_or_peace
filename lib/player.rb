class Player
  require 'rspec'
  require './lib/card'
  require './lib/deck'
  require 'pry'
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

end
