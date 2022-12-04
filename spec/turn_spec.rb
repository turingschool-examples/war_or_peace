#turn type :basic
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'rspec'

RSpec.describe Turn do
    describe 'exists' do
        it 'turn should be a instance of Turn' do
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
            
            turn = Turn.new(player1, player2)
            
            expect(turn).to be_a(Turn)
        end

        it 'initialize' do    
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
            
            turn = Turn.new(player1, player2)
            
            expect(turn.player1).to eq(player1)
            expect(turn.player2).to eq(player2)
        end

        it 'turn.spoils_of_war should be empty' do
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
            
            turn = Turn.new(player1, player2)

            expect(turn.spoils_of_war).to eq([])
        end

        it 'turn.type should equal basic' do
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
            
            turn = Turn.new(player1, player2)
            
            expect(turn.type).to eq(:basic)
        end

        it 'winner should equal turn.winner' do
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
            
            turn = Turn.new(player1, player2)
            
            turn.type
            winner = turn.winner
            expect(winner).to eq(turn.winner)
        end

        it 'spoils_of_war should equal card1 and card3' do
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
            
            turn = Turn.new(player1, player2)

            turn.type 
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([card1, card3])
        end
    
        it 'player1.deck should have added card1 and card3 and player2.deck should have lost card3' do
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
            
            turn = Turn.new(player1, player2)

            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)

            expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
            expect(player2.deck.cards).to eq([card4, card6, card7])
        end
    end 
end    

#turn type :war

RSpec.describe Turn do
    describe 'exists' do
        it 'turn.type should equal basic' do
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
            
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            
            turn = Turn.new(player1, player2)
            
            expect(turn.type).to eq(:war)
        end

        it 'winner should equal turn.winner' do
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
            
            turn = Turn.new(player1, player2)
            
            turn.type
            winner = turn.winner
            expect(winner).to eq(turn.winner)
        end

        xit 'spoils_of_war should equal card1 and card3' do
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
            
            turn = Turn.new(player1, player2)

            turn.type 
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([card1, card3])
        end
    
        xit 'player1.deck should have added card1 and card3 and player2.deck should have lost card3' do
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
            
            turn = Turn.new(player1, player2)

            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)

            expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
            expect(player2.deck.cards).to eq([card4, card6, card7])
        end
    end 
end    


 #turn type :mutually assured destruction

RSpec.describe Turn do
    describe 'exists' do
        xit 'turn should be a instance of Turn' do
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
            
            turn = Turn.new(player1, player2)
            
            expect(turn).to be_a(Turn)
        end
        xit 'initialize' do    
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
            
            turn = Turn.new(player1, player2)
            
            expect(turn.player1).to eq(player1)
            expect(turn.player2).to eq(player2)
        end

        xit 'turn.spoils_of_war should be empty' do
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
            
            turn = Turn.new(player1, player2)

            expect(turn.spoils_of_war).to eq([])
        end

        xit 'turn.type should equal basic' do
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
            
            turn = Turn.new(player1, player2)
            
            expect(turn.type).to eq(:basic)
        end

        xit 'winner should equal turn.winner' do
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
            
            turn = Turn.new(player1, player2)
            
            turn.type
            winner = turn.winner
            expect(winner).to eq(turn.winner)
        end

        xit 'spoils_of_war should equal card1 and card3' do
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
            
            turn = Turn.new(player1, player2)

            turn.type 
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([card1, card3])
        end
    
        xit 'player1.deck should have added card1 and card3 and player2.deck should have lost card3' do
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
            
            turn = Turn.new(player1, player2)

            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)

            expect(player1.deck.cards).to match_array([card2, card5, card8, card1, card3])
            expect(player2.deck.cards).to match_array([card4, card6, card7])
        end
    end 
end    