require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
    it "exists" do
        game = Game.new("dummy", "arguments")

        expect(game).to be_an_instance_of(Game)
    end
    
    it "has readable attributes" do
        game = Game.new("Megan", "Aurora")

        expect(game.p1name).to eq("Megan")
        expect(game.p2name).to eq("Aurora")
        expect(game.turn_count).to eq(1)
    end

    it "builds the deck" do
        game = Game.new("Megan", "Aurora")
        game.build_deck

        expect(game.built_deck.count).to eq(52)
        expect(game.built_deck.percent_high_ranking).to eq(30.77)
    end

    it "shuffles and assigns the deck" do
        game = Game.new("Megan", "Aurora")
        game.build_deck
        game.assign_decks

        expect(game.player1.deck.cards.count).to eq(52)
        expect(game.player2.deck.cards.count).to eq(52)
        expect(game.player2.deck.cards).not_to eq(game.player1.deck.cards)
    end

    it "plays the game" do
        game = Game.new("Megan", "Aurora")
        game.start

        expect(game.winner).not_to eq(nil)
    end
end
