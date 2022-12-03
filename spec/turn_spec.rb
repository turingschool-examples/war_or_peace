require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
    describe 'Basic Turn' do
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
            
            @player1 = Player.new("Megan", deck1)
            @player2 = Player.new("Aurora", deck2)     
            
            @turn = Turn.new(@player1, @player2)
        end

        it 'exists' do
            expect(@turn).to be_a(Turn)
        end

        it 'has readable attributes' do
            expect(@turn.player1).to eq(@player1)
            expect(@turn.player2).to eq(@player2)
            expect(@turn.spoils_of_war).to eq([])
        end

        it 'can get basic turn type' do
            expect(@turn.type).to eq(:basic)
        end

        it 'can get winner' do
            expect(@turn.winner).to eq(@player1)
        end

        it 'can pile basic cards' do
            expected_pile =  [@player1.deck.cards[0], @player2.deck.cards[0]]
            expected_p1_deck = @player1.deck.cards[1..3]
            expected_p2_deck = @player2.deck.cards[1..3]

            expect(@turn.pile_cards).to eq(expected_pile)
            expect(@player1.deck.cards).to eq(expected_p1_deck)
            expect(@player2.deck.cards).to eq(expected_p2_deck)
        end

        it 'can award basic spoils' do
            expected_deck = @turn.winner.deck.cards[1..3]
            expected_deck << @player1.deck.cards[0] << @player2.deck.cards[0]

            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)

            expect(winner.deck.cards).to eq(expected_deck)
        end
    end

    describe 'War Turn' do
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
            deck2 = Deck.new([card4, card3, card6, card7])
            
            @player1 = Player.new("Megan", deck1)
            @player2 = Player.new("Aurora", deck2)     
            
            @turn = Turn.new(@player1, @player2)
        end

        it 'can get war winner' do
            expect(@turn.winner).to eq(@player2)
        end

        it 'can get game over winner' do
            @player2.deck.cards.pop(2)

            expect(@turn.winner).to eq(@player1)
        end

        it 'can get war turn type' do
            expect(@turn.type).to eq(:war)
        end

        it 'can get game over turn type' do
            @player1.deck.cards.pop(2)

            expect(@turn.type).to eq(:game_over)
        end

        it 'can pile war cards' do
            expected_pile =  []
            expected_pile << @player1.deck.cards[0..2] << @player2.deck.cards[0..2]

            expected_p1_deck = [@player1.deck.cards[3]]
            expected_p2_deck = [@player2.deck.cards[3]]
            
            
            expect(@turn.pile_cards).to eq(expected_pile.flatten)
            expect(@player1.deck.cards).to eq(expected_p1_deck)
            expect(@player2.deck.cards).to eq(expected_p2_deck)
        end

        it 'can shuffle spoils' do
            @turn.pile_cards
            unshuffled_spoils = @turn.spoils_of_war
            @turn.shuffle_spoils

            expect(@turn.spoils_of_war.length).to eq(6)
            expect(@turn.spoils_of_war).not_to eq(unshuffled_spoils)
        end
        
        it 'can award war spoils' do
            expected_deck = [@turn.winner.deck.cards[3]]
            expected_deck << @player1.deck.cards[0..2] << @player2.deck.cards[0..2]
           
            winner = @turn.winner
            @turn.pile_cards
            @turn.award_spoils(winner)

            expect(winner.deck.cards).to eq(expected_deck.flatten)
        end
    end

    describe 'Mutually Assured Destruction Turn' do
        before(:each) do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10) 
            card3 = Card.new(:heart, '9', 9)  
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, '8', 8)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)  

            deck1 = Deck.new([card1, card2, card5, card8]) 
            deck2 = Deck.new([card4, card3, card6, card7]) 

            @player1 = Player.new("Megan", deck1)
            @player2 = Player.new("Aurora", deck2)     
            
            @turn = Turn.new(@player1, @player2)
        end

        it 'can get war turn type' do
            expect(@turn.type).to eq(:mutually_assured_destruction)
        end

        it 'can get mutually assured destruction winner' do
            expect(@turn.winner).to eq("No Winner")
        end

        it 'can pile cards for mutually assured destruction' do
            expected_p1_deck = [@player1.deck.cards[3]]
            expected_p2_deck = [@player2.deck.cards[3]]

            expect(@turn.pile_cards).to eq([])
            expect(@player1.deck.cards).to eq(expected_p1_deck)
            expect(@player2.deck.cards).to eq(expected_p2_deck)
        end
    end
end