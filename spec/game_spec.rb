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
    expect(game.turn_count).to eq(1)
  end 

  it 'creates a deck of cards' do 
    game = Game.new 

    # expect(game.deck_of_cards).to eq([]) 
    expect(game.deck_of_cards.length).to eq(16)
  end

  describe '#create_cards' do 
    it 'creates card objects' do 

      # temporary test for the create cards method
      game = Game.new 

      # expect(game.deck_of_cards).to eq([])

      game.create_cards
    
      expect(game.deck_of_cards.length).to eq(16)
    end
  end 

  describe '#create_player_one' do 
    it 'creates player 1 with a deck' do 
      game = Game.new  
      game.create_cards 
      game.create_player_one
      deck1 = game.deck_of_cards[0..7]
      player_1 = Player.new("Megan", deck1)

      expect(game.player_1.name).to eq("Megan")
    end
  end 

  describe '#create_player_one' do 
    it 'creates player 1 with a deck' do 
      game = Game.new  
      game.create_cards 
      game.create_player_one
      deck1 = game.deck_of_cards[8..15]
      player_2 = Player.new("Aurora", deck1)

      expect(game.player_2.name).to eq("Aurora")
    end
  end

  describe '#display_welcome_message' do 
    it ' displays the message before starting the game' do 
      game = Game.new
      
      expect(game.display_welcome_message).to be_a(String)
    end
  end

  describe '#initiate_war' do 
    it 'runs the game of war with a turn object' do 
      game = Game.new 
      player_1 = game.player_1
      player_2 = game.player_2
      turn = Turn.new(player_1, player_2)

      expect(turn).to be_a(Turn)
      expect(turn.player1).to eq(player_1)
      expect(turn.player1.name).to eq("Megan")
    end
  end

end