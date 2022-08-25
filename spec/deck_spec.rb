require "rspec"
require "./lib/card.rb"
require "./lib/deck.rb"

RSpec.describe Deck do
    it "exists" do
      expect(deck.cards).to eq([])
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck).to be_an_instance_of(Deck)
    end

    it "contains cards" do
      expect(deck.cards).to eq([])
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq([card1, card2, card3])

    end

    # xit "contains cards" do
    #   card4 = Card.new(:club, "King", 13)
    #   card5 = Card.new(:spade, "8", 8)
    #   deck.add_to_deck(card4)
    #   deck.add_to_deck(card5)
    #   expect(deck.cards).to eq([card1, card2, card3, card4, card5])
    # end
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
