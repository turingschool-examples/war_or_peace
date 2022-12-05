require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Player do
    context 'Test Set 1' do
        it 'facilitates a turn' do
            card1 = Card.new(:hearts, 'Jack', 11)
            card2 = Card.new(:hearts, 'Ten', 10) 
            card3 = Card.new(:hearts, 'Nine', 9)
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Eight', 8)
            card6 = Card.new(:diamonds, 'Queen', 12)
            card7 = Card.new(:hearts, 'Three', 3)
            card8 = Card.new(:diamonds, 'Two', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2) 

            turn = Turn.new(player1, player2)

            expect(turn).to be_an_instance_of(Turn)
        end

        it 'has players taking a turn' do
            card1 = Card.new(:hearts, 'Jack', 11)
            card2 = Card.new(:hearts, 'Ten', 10) 
            card3 = Card.new(:hearts, 'Nine', 9)
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Eight', 8)
            card6 = Card.new(:diamonds, 'Queen', 12)
            card7 = Card.new(:hearts, 'Three', 3)
            card8 = Card.new(:diamonds, 'Two', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2) 

            turn = Turn.new(player1, player2)

            turn.player1
            turn.player2

            expect(turn.spoils_of_war).to eq([])
        end
    end

    context 'Test Set 2' do
        it 'has a basic turn type' do
            card1 = Card.new(:hearts, 'Jack', 11)
            card2 = Card.new(:hearts, 'Ten', 10) 
            card3 = Card.new(:hearts, 'Nine', 9)
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Eight', 8)
            card6 = Card.new(:diamonds, 'Queen', 12)
            card7 = Card.new(:hearts, 'Three', 3)
            card8 = Card.new(:diamonds, 'Two', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2) 

            turn = Turn.new(player1, player2)
            expect(turn.type).to eq(:basic)
        end

        it 'has a war turn type' do
            card1 = Card.new(:hearts, 'Jack', 11)
            card2 = Card.new(:hearts, 'Ten', 10) 
            card3 = Card.new(:spades, 'Jack', 11)
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Eight', 8)
            card6 = Card.new(:diamonds, 'Queen', 12)
            card7 = Card.new(:hearts, 'Three', 3)
            card8 = Card.new(:diamonds, 'Two', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2) 

            turn = Turn.new(player1, player2)

            expect(turn.type).to eq(:war)
        end

        it 'has a mutually assured destruction turn type' do
            card1 = Card.new(:hearts, 'Jack', 11)
            card2 = Card.new(:hearts, 'Ten', 10) 
            card3 = Card.new(:spades, 'Jack', 11)
            card4 = Card.new(:diamonds, 'Ten', 10) 
            card5 = Card.new(:hearts, 'Queen', 12)
            card6 = Card.new(:diamonds, 'Queen', 12)
            card7 = Card.new(:hearts, 'Three', 3)
            card8 = Card.new(:diamonds, 'Two', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2) 

            turn = Turn.new(player1, player2)

            expect(turn.type).to eq(:mutually_assured_destruction)
        end
    end

    context 'Test Set 3' do
        it 'declares a winner for a basic outcome' do
            card1 = Card.new(:clubs, 'Jack', 11)
            card2 = Card.new(:spades, 'Ten', 10) 
            card3 = Card.new(:hearts, 'Nine', 9)
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Eight', 8)
            card6 = Card.new(:diamonds, 'Queen', 12)

            deck1 = Deck.new([card1, card3, card5])
            deck2 = Deck.new([card2, card4, card6])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)
            
            expect(turn.type).to eq(:basic)
            expect(turn.winner).to eq(player1)
        end

        it 'declares a winner for a war outcome' do
            card1 = Card.new(:clubs, 'Jack', 11)
            card2 = Card.new(:spades, 'Jack', 11) 
            card3 = Card.new(:hearts, 'Nine', 9)
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Eight', 8)
            card6 = Card.new(:diamonds, 'Queen', 12)

            deck1 = Deck.new([card1, card3, card5])
            deck2 = Deck.new([card2, card4, card6])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn.type).to eq(:war)
            expect(turn.winner).to eq(player2)
        end

        it "declares 'No Winner' for a mutually assured destruction outcome" do
            card1 = Card.new(:clubs, 'Jack', 11)
            card2 = Card.new(:spades, 'Jack', 11) 
            card3 = Card.new(:hearts, 'Nine', 9)
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Queen', 12)
            card6 = Card.new(:diamonds, 'Queen', 12)

            deck1 = Deck.new([card1, card3, card5])
            deck2 = Deck.new([card2, card4, card6])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)
        
            expect(turn.type).to eq(:mutually_assured_destruction)
            expect(turn.winner).to eq('No Winner')
        end
    end

    context 'Test Set 4' do
        it 'can pile spoils for war or mutually assured destruction' do
            card1 = Card.new(:hearts, 'Jack', 11)
            card2 = Card.new(:hearts, 'Ten', 10)
            card3 = Card.new(:hearts, 'Nine', 9) 
            card4 = Card.new(:diamonds, 'Jack', 11) 
            card5 = Card.new(:hearts, 'Eight', 8)
            card6 = Card.new(:diamonds, 'Eight', 8)
            card7 = Card.new(:hearts, 'Three', 3)
            card8 = Card.new(:diamonds, 'Two', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card4, card3, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn.type).to eq(:mutually_assured_destruction || :war)
            turn.pile_cards
            expect(turn.spoils_of_war.flatten).to eq(turn.spoils_of_war)
        end

        it 'can pile spoils for a basic turn' do
          card1 = Card.new(:hearts, 'Jack', 11)
          card2 = Card.new(:hearts, 'Ten', 10)
          card3 = Card.new(:hearts, 'Nine', 9) 
          card4 = Card.new(:diamonds, 'King', 13) 
          card5 = Card.new(:hearts, 'Eight', 8)
          card6 = Card.new(:diamonds, 'Eight', 8)
          card7 = Card.new(:hearts, 'Three', 3)
          card8 = Card.new(:diamonds, 'Two', 2)

          deck1 = Deck.new([card1, card2, card5, card8])
          deck2 = Deck.new([card4, card3, card6, card7])

          player1 = Player.new("Megan", deck1)
          player2 = Player.new("Aurora", deck2)

          turn = Turn.new(player1, player2)
          
          expect(turn.type).to eq(:basic)
          expect(turn.winner).to eq(player2)
          turn.pile_cards
          expect(turn.spoils_of_war.flatten).to eq(turn.spoils_of_war)
          
        end

        it 'can distribute spoils to the winner' do
          card1 = Card.new(:hearts, 'Jack', 11)
          card2 = Card.new(:hearts, 'Ten', 10)
          card3 = Card.new(:hearts, 'Nine', 9) 
          card4 = Card.new(:diamonds, 'King', 13) 
          card5 = Card.new(:hearts, 'Eight', 8)
          card6 = Card.new(:diamonds, 'Eight', 8)
          card7 = Card.new(:hearts, 'Three', 3)
          card8 = Card.new(:diamonds, 'Two', 2)

          deck1 = Deck.new([card1, card2, card5, card8])
          deck2 = Deck.new([card4, card3, card6, card7])

          player1 = Player.new("Megan", deck1)
          player2 = Player.new("Aurora", deck2)

          turn = Turn.new(player1, player2)
          
          expect(turn.type).to eq(:basic)
          expect(turn.winner).to eq(player2)
          turn.pile_cards
          expect(turn.spoils_of_war.flatten).to eq(turn.spoils_of_war)
          turn.award_spoils(player2)
          expect(player1.deck.cards_arr.count).to eq(3)
          expect(player2.deck.cards_arr.count).to eq(5)
          expect(turn.spoils_of_war.count).to eq(0)
          
        end
    end
end