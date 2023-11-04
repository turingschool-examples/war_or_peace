require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"

RSpec.describe Turn do

let!(:card1) { Card.new(:heart, 'Jack', 11) }
let!(:card2) { Card.new(:heart, '10', 10) }
let!(:card3) { Card.new(:heart, '9', 9) }
let!(:card4) { Card.new(:diamond, 'Jack', 11) }
let!(:card5) { Card.new(:heart, '8', 8) }
let!(:card6) { Card.new(:diamond, 'Queen', 12) }
let!(:card7) { Card.new(:heart, '3', 3) }
let!(:card8) { Card.new(:diamond, '2', 2) }
let!(:deck1) { Deck.new([card1, card2, card5, card8]) }
let!(:deck2) { Deck.new([card3, card4, card6, card7]) }
let!(:player1) { Player.new("Megan", deck1) }
let!(:player2) { Player.new("Aurora", deck2) }
let!(:turn) { Turn.new(player1, player2) }

  it "exists" do
    expect(turn).to be_an_instance_of(Turn)
  end

  it "has readable attributes" do
    expect(turn.player1).to eq(player1)
    expect(turn.player2).to eq(player2)
    expect(turn.spoils_of_war).to eq([])
  end

  context "basic turn" do
    it "#type" do
      expect(turn.type).to eq(:basic)
    end

    it "#winner" do
      expect(turn.winner).to eq(player1)
      expect(turn.winner).to_not eq(player2)
    end

    it "#pile_cards" do
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card3])
    end

    it "#award_spoils(winner)" do
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
      expect(player2.deck.cards).to eq([card4, card6, card7])
    end
  end

  context "war turn" do
  let!(:deck2) { Deck.new([card4, card3, card6, card7]) }

    it "#type" do
      expect(turn.type).to eq(:war)
    end

    it "#winner" do
      expect(turn.winner).to eq(player2)
      expect(turn.winner).to_not eq(player1)
    end

    it "#pile_cards" do
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
    end

    it "#award_spoils(winner)" do
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      expect(player1.deck.cards).to eq([card8])
      expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
    end
  end
end

