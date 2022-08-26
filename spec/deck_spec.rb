require "rspec"
require "./lib/card.rb"
require "./lib/deck.rb"

RSpec.describe Deck do
  describe '#initialize' do
    it "exists" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck).to be_an_instance_of(Deck)
    end

    it "contains cards" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq([card1, card2, card3])
    end
  end

  describe '#rank of card at a certain index position' do
    it "checks a cards rank based on the cards index position" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq([card1, card2, card3])
      deck.rank_of_card_at(0)
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(1)).to eq(3)
    end
  end

  describe '#high_ranking_cards' do
    it "will return an array of cards in the deck with a rank >= 11" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.high_ranking_cards


      expect(deck.high_ranking_cards).to eq([card1, card3])
      #itterate through the deck
      #identify cards with a rank >11
      #push cards with a rank >11 into an array called high_ranking_cards
      #return the array of cards in the deck that have a rank >11

  end
  end
end
  #   it "checks a cards rank based on the cards index position" do
  #     deck = Deck.new(@cards)
  #     card1 = Card.new(:diamond, "Queen", 12)
  #     card2 = Card.new(:spade, "3", 3)
  #     card3 = Card.new(:heart, "Ace", 14)
  #     deck.add_to_deck(card1)
  #     deck.add_to_deck(card2)
  #     deck.add_to_deck(card3)
  #     deck.rank_of_card_at(0)
  #     expect
  #   end
  #     # deck = Deck.new(cards)
  #     # deck.add_to_deck(card1)
  #     # deck.add_to_deck(card2)
  #     # deck.add_to_deck(card3)
  #
  #
  #     # expect(deck.cards).to eq([card1, card2, card3])
  #     #
  #     # expect(deck.rank_of_card_at(0)).to eq(12)
  #   end
  #
  #
  # # it "adds to deck" do
  # #   card1 = Card.new(:diamond, "Queen", 12)
  # #   card2 = Card.new(:spade, "3", 3)
  # #   card3 = Card.new(:heart, "Ace", 14)
  # #
  # #   card = [card1, card2, card3]
  # #   deck = Deck.new(cards)
  # #   # expect(card.new_deck).to eq([])
  # #   card1.add_to_deck(card1)
  # #   card2.add_to_deck(card2)
  # #   card3.add_to_deck(card3)
