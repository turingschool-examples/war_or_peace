require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'rspec'

describe Game do
    describe 'initialize' do
        before do
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10)
            @card3 = Card.new(:heart, '9', 9)
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card5 = Card.new(:heart, '8', 8)
            @card6 = Card.new(:diamond, 'Queen', 12)
            @card7 = Card.new(:heart, '3', 3)
            @card8 = Card.new(:diamond, '2', 2)
            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([@card3, @card4, @card6, @card7])
            @player1 = Player.new("Megan", @deck1)
            @player2 = Player.new("Aurora", @deck2)
            @turn = Turn.new(@player1, @player2)
            @game = Game.new(@turn)
        end

        it 'is an instance of the Game class' do
            expect(@game).to be_a Game
        end

        it 'contains a turn' do
            expect(@game.turn).to eq(@turn)
        end

        it 'creates a deck of 52 cards' do
            @game.create_deck
            expect(@game.deck_of_cards.count).to eq(52)
        end

        it 'shuffles deck' do
            @game.shuffle_cards
            expect(@game.shuffled_cards).not_to eq(@game.deck_of_cards)
            
        end

        it 'splits the shuffled deck to two players' do
            @game.shuffle_cards
            @game.split_deck
            expect(@player1.deck.count).to eq(26)
            expect(@player2.deck.count).to eq(26)
        end
    end
end