require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'


RSpec.describe Game do

    it "exists" do

        game = Game.new

        expect(game).to be_an_instance_of(Game)

    end

    it "has a welcome message" do
    

        game = Game.new

        expect(game.welcome_message).to eq(nil)

    end


    xit "gets user input" do


        game = Game.new


        #not sure how to test for user_input yet and if this has not been updated to a working state then I couldn't figure it out before submitting.

        #this test would apply to welcome_loop method as well

    end




    it "creates two decks for each player" do

        game = Game.new

        game.create_decks

        expect(game.deck1).to be_an_instance_of(Deck)
        expect(game.deck2).to be_an_instance_of(Deck)
        
    end



    it "has 26 cards in each deck" do

        game = Game.new

        game.create_decks

        expect(game.deck1.cards.count).to eq(26)
        expect(game.deck2.cards.count).to eq(26)

    end

    it "has creates two players" do

        game = Game.new

        game.create_decks

        expect(game.player1.name).to eq("Mufasa")
        expect(game.player2.name).to eq("Skar")


    end

    xit "has the game logic which should end with a print statement" do

        #not sure how to test this part yet because cards get randomized

        game = Game.new

        game.create_decks

        expect(game.start).to eq(nil)

        #need to test user input still, so disabled this test


    end





end

