require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'rspec'

describe Turn do
    describe 'turn type :basic' do
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
        end

        it 'exists and has two player' do
            expect(@turn).to be_a(Turn)
            expect(@turn.player1).to eq(@player1)
            expect(@turn.player2).to eq(@player2)
        end

        it '#spoils_of_war is default empty' do
            expect(@turn.spoils_of_war).to be_empty
        end

        it 'current #type of turn' do
            expect(@turn.type).to eq(:basic)
        end

        it 'returns #winner of turn' do
            expect(@turn.winner).to eq(@player1)
        end

        it 'use #pile_cards to send cards to @spoils_of_war' do
            winner = @turn.winner
            @turn.pile_cards

            expect(@turn.spoils_of_war.count).to eq(2)
        end

        it "@award_spoils to the winner's deck" do
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)

            expect(@player1.deck.cards.count).to eq(5)
            expect(@player2.deck.cards.count).to eq(3)
        end
    end

    describe 'Turn type :war' do
        before(:each) do
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10)
            @card3 = Card.new(:heart, '9', 9)
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card5 = Card.new(:heart, '8', 8)
            @card6 = Card.new(:diamond, 'Queen', 12)
            @card7 = Card.new(:heart, '3', 3)
            @card8 = Card.new(:diamond, '2', 2)
            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([@card4, @card3, @card6, @card7])
            @player1 = Player.new("Megan", @deck1)
            @player2 = Player.new("Aurora", @deck2)
            @turn = Turn.new(@player1, @player2)
        end

        it 'is turn type :war' do
            expect(@turn.type).to eq(:war)
        end

        it 'it shows us player2 won results of :war' do
            winner = @turn.winner
            
            expect(winner).to be(@player2)
        end

        it 'adds 6 cards to spoils_of_war' do
            @turn.pile_cards
            
            expect(@turn.spoils_of_war.count).to eq(6)
        end

        it '#awards_spoils to winners deck' do
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)

            expect(@player1.deck.cards.count).to eq(1)
            expect(@player2.deck.cards.count).to eq(7)
        end
    end

    describe 'Turn type :mutually_assured_destruction' do
        before(:each) do
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10)
            @card3 = Card.new(:heart, '9', 9)
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card5 = Card.new(:heart, '8', 8)
            @card6 = Card.new(:diamond, '8', 8)
            @card7 = Card.new(:heart, '3', 3)
            @card8 = Card.new(:diamond, '2', 2)
            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([@card4, @card3, @card6, @card7])
            @player1 = Player.new("Megan", @deck1)
            @player2 = Player.new("Aurora", @deck2)
            @turn = Turn.new(@player1, @player2)
        end

        it 'turn type is :mutually_assured_destruction' do
            expect(@turn.type).to eq(:mutually_assured_destruction)
        end

        it 'has no winner' do
            winner = @turn.winner
            expect(winner).to eq('No Winner')
        end

        it 'has no cards sent to spoils_of_war and player lose 3 cards' do
            @turn.pile_cards

            expect(@turn.spoils_of_war).to eq([])
            expect(@player1.deck.cards.count).to eq(1)
            expect(@player2.deck.cards.count).to eq(1)

        end
    end
end