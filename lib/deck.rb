require "forwardable"
require "./lib/card"

class Deck
  extend Forwardable

  # What is all of this? Basically, this is dealing with the Law of
  # Demeter. If someone calls deck.length, forward that to deck.cards.length.
  def_delegators :@cards, :length, :shuffle, :shuffle!

  def self.with_cards
    deck = Deck.new

    SUITS.each do |suit|
      RANKS.keys.each do |rank|
        card = Card.new(suit, rank)
        deck.add_card(card)
      end
    end

    deck
  end

  def initialize(cards = [])
    @cards = []
    add_cards(cards)
  end

  def cards
    # Only the deck itself should be able to modify its cards.
    # We don't want to give outside objects access. If another
    # object wants to modify the cards in the deck, it needs to
    # talk to the deck itself through `add_card` and `remove_card`.
    @cards.clone.freeze
  end

  def add_card(card)
    raise TypeError, "#{card} is not an instance of Card" unless card.is_a? Card
    @cards << card
  end

  def add_cards(cards)
    cards.each { |card| add_card(card) }
  end

  def remove_card
    remove_cards.first
  end

  def remove_cards(number_of_cards = 1)
    @cards.shift(number_of_cards)
  end

  def rank_of_card_at(index)
    @cards.at(index)&.rank
  end

  def above_rank(rank)
    @cards.select { |card| card.rank >= rank }
  end

  def high_ranking_cards
    above_rank(11)
  end

  def percent_high_ranking
    (high_ranking_cards.length.to_f / cards.length) * 100
  end

  def split(number_of_decks = 2)
    shuffle.each_slice(@cards.length / number_of_decks).map { |cards| Deck.new(cards) }
  end
end
