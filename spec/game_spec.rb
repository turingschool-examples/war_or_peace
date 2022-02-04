require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
    it "exists" do
        game = Game.new("dummy", "argument")

        expect(game).to be_an_instance_of(Game)
    end
    
    it "has readable attributes" do
        deck = Deck.new([])
        p1 = Player.new("Megan", deck)
        p2 = Player.new("Aurora", deck)
        game = Game.new(p1, p2)

        expect(game.player1.name).to eq("Megan")
        expect(game.player2.name).to eq("Aurora")
        expect(game.turn_count).to eq(1)
    end

    it "builds the deck" do
        game = Game.new("Megan", "Aurora")
        game.build_deck

        expect(game.built_deck.count).to eq(52)
        expect(game.built_deck.percent_high_ranking).to eq(30.77)
    end

    it "shuffles the deck" do
        game = Game.new
    end
end
