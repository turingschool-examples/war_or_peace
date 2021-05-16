require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
    it 'exists' do
        card1 = Card.new(:heart, '2', 2)
        card23 = Card.new(:club, 'Jack', 11)
        deck1 = Deck.new([card1])
        deck2 = Deck.new([card23])
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        game = Game.new

        expect(game).to be_an_instance_of(Game)
    end

    it 'displays welcome message' do
        game = Game.new

        expect(game.welcome).to be_a(String)
    end

    it 'counts turns' do
        game = Game.new
        
        game.turn_counter
        expect(game.turn).to eq(1)

        game.turn_counter
        expect(game.turn).to eq(2)
    end

    
end
