require 'rspec'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

RSpec.describe Turn do
    #turn type :basic
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

    it "has instances of Card" do
        expect(card1).to be_an_instance_of(Card)
        expect(card2).to be_an_instance_of(Card)
        expect(card3).to be_an_instance_of(Card)
        expect(card4).to be_an_instance_of(Card)
        expect(card5).to be_an_instance_of(Card)
        expect(card6).to be_an_instance_of(Card)
        expect(card7).to be_an_instance_of(Card)
        expect(card8).to be_an_instance_of(Card)
    end

    it "has instances of Deck" do
        expect(deck1).to be_an_instance_of(Deck)
        expect(deck2).to be_an_instance_of(Deck)
    end

    it "has instances of Player" do
        expect(player1).to be_an_instance_of(Player)
        expect(player2).to be_an_instance_of(Player)
    end

    it "is an instance of Turn" do
        expect(turn).to be_an_instance_of(Turn)
    end

    it "can call player 1" do
        expect(turn.player1).to eq(player1)
        expect(turn.player1.name).to eq("Megan")
    end

    it "can call player 2" do
        expect(turn.player2).to eq(player2)
        expect(turn.player2.name).to eq("Aurora")
    end
  
    it "can read spoils of war as an empty array" do
     expect(turn.spoils_of_war).to eq([])
    end

    it "can tell the turn type" do
        expect(turn.type).to eq(:basic)
    end

    it "can tell who won" do
        expect(turn.winner).to eq(player1)
        expect(turn.winner.name).to eq("Megan")
    end

    it "can put cards into spoils pile" do
        expect(turn.pile_cards).to eq(turn.spoils_of_war)
        expect(turn.spoils_of_war[0].rank).to eq(11)
        expect(turn.spoils_of_war[1].rank).to eq(9)
    end

    it "can add the spoils pile to the winning player's deck" do
        turn.award_spoils(player1)

        expect(turn.player1.deck.cards.length).to eq(5)
        expect(turn.player2.deck.cards.length).to eq(3)

        expect(turn.player1.deck.rank_of_card_at(3)).to eq(11)
        expect(turn.player1.deck.rank_of_card_at(4)).to eq(9)
    end
end

RSpec.describe Turn do
    #turn type :war
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

    it "has instances of Card" do
        expect(card1).to be_an_instance_of(Card)
        expect(card2).to be_an_instance_of(Card)
        expect(card3).to be_an_instance_of(Card)
        expect(card4).to be_an_instance_of(Card)
        expect(card5).to be_an_instance_of(Card)
        expect(card6).to be_an_instance_of(Card)
        expect(card7).to be_an_instance_of(Card)
        expect(card8).to be_an_instance_of(Card)
    end

    it "has instances of Deck" do
        expect(deck1).to be_an_instance_of(Deck)
        expect(deck2).to be_an_instance_of(Deck)
    end

    it "has instances of Player" do
        expect(player1).to be_an_instance_of(Player)
        expect(player2).to be_an_instance_of(Player)
    end

    it "is an instance of Turn" do
        expect(turn).to be_an_instance_of(Turn)
    end

    it "can call player 1" do
        expect(turn.player1).to eq(player1)
        expect(turn.player1.name).to eq("Megan")
    end

    it "can call player 2" do
        expect(turn.player2).to eq(player2)
        expect(turn.player2.name).to eq("Aurora")
    end
  
    it "can read spoils of war as an empty array" do
     expect(turn.spoils_of_war).to eq([])
    end

    it "can tell the turn type" do
        expect(turn.type).to eq(:war)
    end

    it "can tell who won" do
        expect(turn.winner).to eq(player2)
        expect(turn.winner.name).to eq("Aurora")
    end

    it "can put cards into spoils pile" do
        turn.pile_cards

        expect(turn.spoils_of_war[0].rank).to eq(11)
        expect(turn.spoils_of_war[1].rank).to eq(11)
        expect(turn.spoils_of_war[4].rank).to eq(8)
        expect(turn.spoils_of_war[5].rank).to eq(12)
    end

    it "can add the spoils pile to the winning player's deck" do
        turn.award_spoils(player2)

        expect(turn.player1.deck.cards.length).to eq(1)
        expect(turn.player2.deck.cards.length).to eq(7)

        expect(turn.player1.deck.rank_of_card_at(0)).to eq(2)
        expect(turn.player2.deck.rank_of_card_at(6)).to eq(12)
    end
end

RSpec.describe Turn do
    #turn type :mutually_assured_destruction
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

    it "has instances of Card" do
        expect(card1).to be_an_instance_of(Card)
        expect(card2).to be_an_instance_of(Card)
        expect(card3).to be_an_instance_of(Card)
        expect(card4).to be_an_instance_of(Card)
        expect(card5).to be_an_instance_of(Card)
        expect(card6).to be_an_instance_of(Card)
        expect(card7).to be_an_instance_of(Card)
        expect(card8).to be_an_instance_of(Card)
    end

    it "has instances of Deck" do
        expect(deck1).to be_an_instance_of(Deck)
        expect(deck2).to be_an_instance_of(Deck)
    end

    it "has instances of Player" do
        expect(player1).to be_an_instance_of(Player)
        expect(player2).to be_an_instance_of(Player)
    end

    it "is an instance of Turn" do
        expect(turn).to be_an_instance_of(Turn)
    end

    it "can call player 1" do
        expect(turn.player1).to eq(player1)
        expect(turn.player1.name).to eq("Megan")
    end

    it "can call player 2" do
        expect(turn.player2).to eq(player2)
        expect(turn.player2.name).to eq("Aurora")
    end
  
    it "can read spoils of war as an empty array" do
     expect(turn.spoils_of_war).to eq([])
    end

    it "can tell the turn type" do
        expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it "can tell who won" do
        expect(turn.winner).to eq("No Winner")
    end

    it "can remove cards from game" do
        turn.pile_cards

        expect(turn.spoils_of_war).to eq([])
        expect(turn.player1.deck.cards.length).to eq(1)
        expect(turn.player2.deck.cards.length).to eq(1)
        expect(turn.player1.deck.rank_of_card_at(0)).to eq(2)
        expect(turn.player2.deck.rank_of_card_at(0)).to eq(3)
    end
end