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

            expect(turn.player1).to eq(player1)
            expect(turn.player2).to eq(player2)
            expect(turn.spoils_of_war).to eq([])
        end

        it 'can reassign the ranks to a default variable' do
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

            expect(player1.deck.rank_of_card_at(0)).to eq(11)
            expect(player2.deck.rank_of_card_at(0)).to eq(10)
            expect(player1.deck.rank_of_card_at(1)).to eq(9)
            expect(player2.deck.rank_of_card_at(1)).to eq(11)
            expect(player1.deck.rank_of_card_at(2)).to eq(8)
            expect(player2.deck.rank_of_card_at(2)).to eq(12)

        end

        it 'can create an array of the instanced ranks' do

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

            expect(turn.turn_type).to eq(:basic)
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

            expect(turn.turn_type).to eq(:war)
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

            expect(turn.turn_type).to eq(:mutually_assured_destruction)
        end
    end
end