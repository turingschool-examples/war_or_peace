require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
    describe 'turn type :basic' do
        # before(:each) do
        #         card1 = Card.new(:heart, 'Jack', 11)
        #         card2 = Card.new(:heart, '10', 10)
        #         card3 = Card.new(:heart, '9', 9)
        #         card4 = Card.new(:diamond, 'Jack', 11)
        #         card5 = Card.new(:heart, '8', 8)
        #         card6 = Card.new(:diamond, 'Queen', 12)
        #         card7 = Card.new(:heart, '3', 3)  
        #         card8 = Card.new(:diamond, '2', 2) 
        #         deck1 = Deck.new([card1, card2, card5, card8])
        #         deck2 = Deck.new([card3, card4, card6, card7])
        #         player1 = Player.new("Megan", deck1)
        #         player2 = Player.new("Aurora", deck2)
        #         turn = Turn.new(player1, player2)
        #     end

            it 'can determine the type of turn' do
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

            it 'can determine a winner of basic' do
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
                expect(turn.winner).to eq(player1)
            end
            
            it 'can move spoils of war to winners hand' do
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
                expect(turn.spoils_of_war).to include(card1, card3)
                turn.award_spoils(winner)
                expect(turn.player1.deck.cards).to include(card1, card3)
            end
        # end     
    end
    describe 'turn type :war' do
        it 'can determine type :war' do
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

        it 'can determine winner of :war' do
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
            expect(turn.winner).to eq(player2)
        end

        it 'can will add first 3 cards of each player to spoils' do
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
            winner = turn.winner
            turn.pile_cards
            expect(turn.spoils_of_war).to include(card1, card2, card5, card4, card3, card6)
        end

        it 'can assign spoils to winner of :war' do
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
            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)
            expect(turn.player1.deck.cards).to include(card8)
            expect(turn.player2.deck.cards).to include(card1, card2, card3, card4, card5, card6, card7)
        end

    end
    describe 'turn type :mutual_destruction' do
        it 'can determine :mad type' do
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
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)
            expect(turn.type).to eq(:mutual_destruction)
        end

        it 'can determine there is no winner' do
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
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)
            binding.pry
            expect(turn.winner).to eq("No Winner")
        end

        it 'can destroy top 3 cards' do
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
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)
            winner = turn.winner
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([])
            expect(turn.player1.deck.cards.count).to eq(1)
            expect(turn.player2.deck.cards.count).to eq(1)
        end


    end
end