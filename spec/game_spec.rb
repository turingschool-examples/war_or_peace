require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require 'rspec'

describe Game do
    describe 'initialize' do
        before do
            @game = Game.new()
        end

        it 'is an instance of the Game class' do

            expect(@game).to be_a Game
        end

        it 'creates 52 cards' do
            # @game.create_deck
            expect(@game.cards.count).to eq(52)
        end

        it 'shuffles deck' do

            expect(@game.shuffled_cards).not_to eq(@game.cards)
            
        end

    end
    describe 'Running first parts of game' do
        before do
            @game = Game.new()
        end
        it 'splits the shuffled cards to two players' do
            # @game.create_cards
            @game.shuffle_cards
            @game.split_deck

            expect(@game.deck1.cards.count).to eq(26)
            expect(@game.deck2.cards.count).to eq(26)
            expect(@game.player1.deck.cards).not_to eq(@game.player2.deck.cards.count)

        end

        it '#deals_cards' do
            # @game.creates_cards
            @game.deal_cards
            
            expect(@game.deck1.cards.count).to eq(26)
            expect(@game.deck2.cards.count).to eq(26)
            expect(@game.player1.deck.cards).not_to eq(@game.player2.deck.cards.count)
        end
    end
end