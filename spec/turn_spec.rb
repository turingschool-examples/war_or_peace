require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
    it "exists and has readable attributes" do
        # I don't actually know if I can declare this outside of the rspec test.  Will ask later, good for refactoring.
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
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        turn = Turn.new(player1, player2)
        
        expect(turn).to be_an_instance_of(Turn)
        expect(turn.player1).to eq(player1)
        expect(turn.player2).to eq(player2)
        expect(turn.spoils_of_war).to eq([])
    end

    it "handles basic turn" do
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
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:basic)
        expect(turn.winner).to eq("Megan")

        turn.pile_cards

        expect(turn.spoils_of_war).to eq([card1, card3])

        turn.award_spoils

        expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
        expect(turn.player2.deck.cards).to eq([card4, card6, card7])
    end

    it "handles war turn" do
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
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:war)
        expect(turn.winner).to eq("Aurora")

        turn.pile_cards

        expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])

        turn.award_spoils
        
        expect(turn.player1.deck.cards).to eq([card8])
        expect(turn.player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
    end

    it "handles MAD turn" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, '8', 8)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)
        deck1 = Deck.new([card5, card2, card1, card8])
        deck2 = Deck.new([card6, card3, card4, card7])
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:mutually_assured_destruction)
        expect(turn.winner).to eq("No Winner")

        turn.pile_cards

        expect(turn.spoils_of_war).to eq([])
        expect(turn.player1.deck.cards).to eq([card8])
        expect(turn.player2.deck.cards).to eq([card7])
    end

end
