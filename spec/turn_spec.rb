require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
    before(:each) do
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

    describe '#initialize' do
        it 'requires cards, decks, and players' do

        expect(card1).to be_a(Card)
        expect(card2).to be_a(Card)
        expect(card3).to be_a(Card)
        expect(card4).to be_a(Card)
        expect(card5).to be_a(Card)
        expect(card6).to be_a(Card)
        expect(card7).to be_a(Card)
        expect(card8).to be_a(Card)
        expect(deck1).to be_a(Deck)
        expect(deck2).to be_a(Deck)
        expect(player1).to be_a(Player)
        expect(player2).to be_a(Player)
        end 

        it 'exists and has 2 players' do
            turn = Turn.new(player1, player2)

            expect(turn).to be_a(Turn)
            expect(turn.player1).to eq(player1)
            expect(turn.player2).to eq(player2)
        end
        
        it 'starts with no spoils of war' do
            turn = Turn.new(player1, player2)

            expect(turn.spoils_of_war).to eq([])
        end
    end

    describe 'type' do
        it 'has the type :basic' do
            turn = Turn.new(player1, player2)

            expect(turn.type).to eq(:basic)
        end
    end 
    end 
end 
