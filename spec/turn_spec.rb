require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

describe Turn do

        it 'exists' do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)
            cards = [card1, card2, card3, card4, card5, card6, card7, card8]

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])
        
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)
            expect(turn).to be_an_instance_of(Turn)
        end

        describe 'type' do
            it 'basic turn' do
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)
                cards = [card1, card2, card3, card4, card5, card6, card7, card8]

                deck1 = Deck.new([card1, card2, card5, card8])
                deck2 = Deck.new([card3, card4, card6, card7])
        
                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)
                expect(turn.type).to eq(:basic)
            end

            it 'war turn' do
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)
                cards = [card1, card2, card3, card4, card5, card6, card7, card8]

                deck1 = Deck.new([card1, card2, card5, card8])
                deck2 = Deck.new([card4, card3, card6, card7])
        
                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)
                expect(turn.type).to eq(:war)
            end

            # it 'mutually assured destruction turn' do
            # end
        end

        describe  'pile_cards' do 
            it ':basic, sends one card (top card) to the spoils pile' do 
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)
                cards = [card1, card2, card3, card4, card5, card6, card7, card8]

                deck1 = Deck.new([card1, card2, card5, card8])
                deck2 = Deck.new([card3, card4, card6, card7])
        
                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)
                turn.pile_cards
                expect(turn.spoils_of_war).to eq([card1, card3])
            end

            it ':war, sends three cards (top three) to the spoils pile' do
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)
                cards = [card1, card2, card3, card4, card5, card6, card7, card8]

                deck1 = Deck.new([card1, card2, card5, card8])
                deck2 = Deck.new([card4, card3, card6, card7])
        
                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)
                turn.pile_cards 
                expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])

            end 

            # it ':mutually_assured_destruction, remove top three cards in deck, not sent to spoils pile (just removed)' do
            # end 
        end

        describe 'award_spoils' do 
            it 'add each of the cars in the spoils_of_war array 
            to the deck that belongs to the winner of the turn' do 
                card1 = Card.new(:heart, 'Jack', 11)
                card2 = Card.new(:heart, '10', 10)
                card3 = Card.new(:heart, '9', 9)
                card4 = Card.new(:diamond, 'Jack', 11)
                card5 = Card.new(:heart, '8', 8)
                card6 = Card.new(:diamond, 'Queen', 12)
                card7 = Card.new(:heart, '3', 3)
                card8 = Card.new(:diamond, '2', 2)
                cards = [card1, card2, card3, card4, card5, card6, card7, card8]

                deck1 = Deck.new([card1, card2, card5, card8])
                deck2 = Deck.new([card3, card4, card6, card7])
        
                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)

                turn = Turn.new(player1, player2)
                turn.pile_cards
                expect(turn.spoils_of_war).to eq([card1, card3])
                turn.spoils_of_war
                turn.award_spoils(player1)
                
                expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
            end
        end
    end


    

