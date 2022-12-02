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

        it 'creates 52 cards' do
            @game.create_cards
            expect(@game.cards.count).to eq(52)
        end

        it 'shuffles deck' do
            @game.create_cards
            @game.shuffle_cards
            expect(@game.shuffled_cards).not_to eq(@game.cards)
            
        end
    end
    describe 'Running first parts of game' do
        before do
            @game = Game.new
        end
        it 'splits the shuffled cards to two players' do
            @game.create_cards
            @game.shuffle_cards
            @game.split_deck
            player1_deck = @game.individual_deck[0]
            player2_deck = @game.individual_deck[1]
            
            expect(player1_deck.count).to eq(26)
            expect(player2_deck.count).to eq(26)

            deck1 = Deck.new(player1_deck)
            deck2 = Deck.new(player2_deck)
            player1 = Player.new('Megan', deck1)
            player2 = Player.new('Aurora', deck1)
            expect(player1.deck.cards.count).to eq(26)
            expect(player2.deck.cards.count).to eq(26)
        end

        it 'creates, ' do
            @game.start

            player1_deck = @game.individual_deck[0]
            player2_deck = @game.individual_deck[1]
            
            expect(player1_deck.count).to eq(26)
            expect(player2_deck.count).to eq(26)

            deck1 = Deck.new(player1_deck)
            deck2 = Deck.new(player2_deck)
            player1 = Player.new('Megan', deck1)
            player2 = Player.new('Aurora', deck1)
            expect(player1.deck.cards.count).to eq(26)
            expect(player2.deck.cards.count).to eq(26)
        end
    end
end