require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  context "basic" do
    let(:card1) {Card.new(:heart, 'Jack', 11)}
    let(:card2) {Card.new(:heart, '10', 10)}
    let(:card3) {Card.new(:heart, '9', 9)}
    let(:card4) {Card.new(:diamond, 'Jack', 11)}
    let(:card5) {Card.new(:heart, '8', 8)}
    let(:card6) {Card.new(:diamond, 'Queen', 12)}
    let(:card7) {Card.new(:heart, '3', 3)}
    let(:card8) {Card.new(:diamond, '2', 2)}
    let(:deck1) {Deck.new([card1, card2, card5, card8])}
    let(:deck2) {Deck.new([card3, card4, card6, card7])}
    let(:player1) {Player.new("Megan", deck1)}
    let(:player2) {Player.new("Aurora", deck2)}
    let(:spoils_of_war) {[]}
    let(:turn) {Turn.new(player1, player2)}

    it "can describe a basic turn type" do
      #before(:each) do
      expect(turn).to be_a(Turn)
    end

    it 'returns the appropriate Turn type' do
      expect(turn.type).to eq(:basic)
    end

    it "determines the winner" do
      expect(turn.winner).to eq(player1)
    end

    it "piles the used cards" do
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card3])
    end

    it 'awards spoils to the winner' do
      expect(turn.winner.deck.cards).to eq(player1.deck.cards)
    end
  end

  context "war" do
    let(:card1) {Card.new(:heart, 'Jack', 11)}
    let(:card2) {Card.new(:heart, '10', 10)}
    let(:card3) {Card.new(:heart, '9', 9)}
    let(:card4) {Card.new(:diamond, 'Jack', 11)}
    let(:card5) {Card.new(:heart, '8', 8)}
    let(:card6) {Card.new(:diamond, 'Queen', 12)}
    let(:card7) {Card.new(:heart, '3', 3)}
    let(:card8) {Card.new(:diamond, '2', 2)}
    let(:deck1) {Deck.new([card1, card2, card5, card8])}
    let(:deck2) {Deck.new([card4, card3, card6, card7])}
    let(:player1) {Player.new("Megan", deck1)}
    let(:player2) {Player.new("Aurora", deck2)}
    let(:spoils_of_war) {[]}
    let(:turn) {Turn.new(player1, player2)}

    it 'returns the appropriate Turn type' do
      expect(turn.type).to eq(:war)
    end

    it "determines the winner" do
      expect(turn.winner).to eq(player2)
    end

    it "piles the used cards" do
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])
    end

    it 'awards spoils to the winner' do
      expect(turn.winner.deck.cards).to eq(player2.deck.cards)
    end
  end

  context "mutually_assured_destruction" do
    let(:card1) {Card.new(:heart, 'Jack', 11)}
    let(:card2) {Card.new(:heart, '10', 10)}
    let(:card3) {Card.new(:heart, '9', 9)}
    let(:card4) {Card.new(:diamond, 'Jack', 11)}
    let(:card5) {Card.new(:heart, '8', 8)}
    let(:card6) {Card.new(:diamond, '8', 8)}
    let(:card7) {Card.new(:heart, '3', 3)}
    let(:card8) {Card.new(:diamond, '2', 2)}
    let(:deck1) {Deck.new([card1, card2, card5, card8])}
    let(:deck2) {Deck.new([card4, card3, card6, card7])}
    let(:player1) {Player.new("Megan", deck1)}
    let(:player2) {Player.new("Aurora", deck2)}
    let(:spoils_of_war) {[]}
    let(:turn) {Turn.new(player1, player2)}

    it 'returns the appropriate Turn type' do
      expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it "determines the winner" do
      expect(turn.winner).to eq("No Winner")
    end

    it "piles the used cards" do
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([])
    end
  end
end
