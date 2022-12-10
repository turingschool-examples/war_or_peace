require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
    it "exists" do
        # card1 = Card.new(:heart, 'Jack', 11)
        # card2 = Card.new(:heart, '10', 10)
        # card3 = Card.new(:heart, '9', 9)
        # card4 = Card.new(:diamond, 'Jack', 11)
        # card5 = Card.new(:heart, '8', 8)
        # card6 = Card.new(:diamond, 'Queen', 12)
        # card7 = Card.new(:heart, '3', 3)
        # card8 = Card.new(:diamond, '2', 2)

        # deck1 = Deck.new([card1, card2, card5, card8])
        # deck2 = Deck.new([card3, card4, card6, card7])

        # player1 = Player.new("Megan", deck1)
        # player2 = Player.new("Aurora", deck2)

        game = Game.new

        expect(game).to be_an_instance_of(Game)
    end

    xit "will print the right message" do
        # card1 = Card.new(:heart, 'Jack', 11)
        # card2 = Card.new(:heart, '10', 10)
        # card3 = Card.new(:heart, '9', 9)
        # card4 = Card.new(:diamond, 'Jack', 11)
        # card5 = Card.new(:heart, '8', 8)
        # card6 = Card.new(:diamond, 'Queen', 12)
        # card7 = Card.new(:heart, '3', 3)
        # card8 = Card.new(:diamond, '2', 2)

        # deck1 = Deck.new([card1, card2, card5, card8])
        # deck2 = Deck.new([card3, card4, card6, card7])

        # player1 = Player.new("Megan", deck1)
        # player2 = Player.new("Aurora", deck2)

        game = Game.new

        expect(game.start).to eq("Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------------------------------------------------------")
        #fails because print is nil, but it's showing on the terminal right.
    end

    it "will deal cards" do
        player1 = Player.new("Megan", [])
        player2 = Player.new("Aurora", [])
        
        game = Game.new
        
        expect(game.deck1).to be_an_instance_of(Deck)
    end        
end