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

      # temporary test for the create cards method
      game = Game.new 

      expect(game.deck_of_cards).to eq([])

      game.create_cards
    
      expect(game.deck_of_cards.length).to eq(16)
    end
  end 

  describe '#set_up' do 
    it 'creates 2 players and gives them each a deck' do 
      game = Game.new 

      game.create_cards

      deck = Deck.new(@deck_of_cards) 
      #require 'pry'; binding.pry
      deck1 = game.deck_of_cards[0..7]
      deck2 = game.deck_of_cards[7..15] 

      game.set_up

      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2) 

      expect(player1.deck.length).to eq(8)
    end
  end

  describe '#display_welcome_message' do 
    it ' displays the message before starting the game' do 
      game = Game.new
      
      expect(game.display_welcome_message).to be_a(String)
    end
  end


end