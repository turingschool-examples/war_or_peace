require 'rspec'
require './lib/card'
require './lib/deck' 
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do 
  it 'exists and has a turn count' do 
    game = Game.new

    expect(game).to be_a(Game)
    expect(game.turn_count).to eq(0)
  end 

  it 'has an empty deck to store cards later' do 
    game = Game.new 

    expect(game.deck_of_cards).to eq([])
  end

  describe '#create_cards' do 
    it 'creates card objects' do 
      game = Game.new 

      expect(game.deck_of_cards).to eq([])

      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)  
      card3 = Card.new(:heart, 'Ace', 14) 

      expect(game.deck_of_cards).to eq([card1, card2, card3])
    end
  end


end