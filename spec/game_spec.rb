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
        expect(game.turns).to eq(1)

        game.turn_counter
        expect(game.turns).to eq(2)
    end

    it 'prints winner' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)
        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)
        turn = Turn.new(player1, player2)
        game = Game.new

        expect(turn.winner).to eq(player1)
        expect(game.print_winner).to match('Megan won 2 cards')
    end
end
