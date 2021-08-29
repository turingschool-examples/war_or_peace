require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

describe Turn do

  describe "#initialize" do
    it "creates an instance of class Turn" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      card3 = Card.new(:clubs, '8', 8)
      card4 = Card.new(:spades, '5', 5)
      card5 = Card.new(:hearts, '4', 4)
      card6 = Card.new(:hearts, '7', 7)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new("Jacob", deck1)
      player2 = Player.new("Bacoj", deck2)
      turn1 = Turn.new(player1, player2)

      expect(turn1).to be_an_instance_of(Turn)
    end
  end

  describe "attr_reader" do
    it "has readable attributes" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      card3 = Card.new(:clubs, '8', 8)
      card4 = Card.new(:spades, '5', 5)
      card5 = Card.new(:hearts, '4', 4)
      card6 = Card.new(:hearts, '7', 7)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new("Jacob", deck1)
      player2 = Player.new("Bacoj", deck2)
      turn1 = Turn.new(player1, player2)

      expect(turn1.player1).to eq(player1)
      expect(turn1.player2).to eq(player2)
    end
  end

  describe '#type' do
    it "returns the state of the turn" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      card3 = Card.new(:clubs, '8', 8)
      card4 = Card.new(:spades, '5', 5)
      card5 = Card.new(:hearts, '4', 4)
      card6 = Card.new(:hearts, '7', 7)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new("Jacob", deck1)
      player2 = Player.new("Bacoj", deck2)
      turn1 = Turn.new(player1, player2)

      expect(turn1.type).to eq(:basic)
    end
  end

  describe "#winner" do
    it "returns the winner of the turn" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      card3 = Card.new(:clubs, '8', 8)
      card4 = Card.new(:spades, '5', 5)
      card5 = Card.new(:hearts, '4', 4)
      card6 = Card.new(:hearts, '7', 7)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new("Jacob", deck1)
      player2 = Player.new("Bacoj", deck2)
      turn1 = Turn.new(player1, player2)

      expect(turn1.winner).to eq(turn1.player2)
    end
  end

  describe "#pile_cards" do
    it "appends reward cards to @spoils_of_war array" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      card3 = Card.new(:clubs, '8', 8)
      card4 = Card.new(:spades, '5', 5)
      card5 = Card.new(:hearts, '4', 4)
      card6 = Card.new(:hearts, '7', 7)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new("Jacob", deck1)
      player2 = Player.new("Bacoj", deck2)
      turn1 = Turn.new(player1, player2)
      turn1.pile_cards

      expect(turn1.spoils_of_war).to eq([card1, card4])
    end
  end

  describe "#award_spoils" do
    it "appends @spoils_of_war_array to thw winner's cards array" do
      card1 = Card.new(:spade, '3', 3)
      card2 = Card.new(:diamonds, 'king', 13)
      card3 = Card.new(:clubs, '8', 8)
      card4 = Card.new(:spades, '5', 5)
      card5 = Card.new(:hearts, '4', 4)
      card6 = Card.new(:hearts, '7', 7)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new("Jacob", deck1)
      player2 = Player.new("Bacoj", deck2)
      turn1 = Turn.new(player1, player2)
      turn1.pile_cards
      turn1.award_spoils

      expect(player2.deck.cards).to include(card1)
    end
  end

end
