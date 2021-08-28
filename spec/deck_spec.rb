require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do

  #"before(:each) do" block to contain setup for deck of cards using instance variables

  describe '#initialize' do
    it 'creates an array equal to the cards variable' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq(cards)
    end

    it 'creates an array of cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to be_a(Array)
    end
  end

  describe '#rank_of_card_at' do
    it 'gives us the rank of the chosen card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
    end

    it 'gives us the rank of the chosen card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'gives us the rank of the chosen card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.rank_of_card_at(1)).to eq(3)
    end
  end

  describe '#high_ranking_cards' do
    it 'gives us an array of cards that rank 11 or above' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe '#percent_high_ranking' do
    it 'returns a percentage of the cards that are high ranking' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe '#remove_card' do
    it 'removes the first card from the deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.remove_card).to eq(card1)
    end

    it 'causes there to be two remaining cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card

      expect(deck.cards).to eq ([card2, card3])
    end

    it 'causes there to only have one high remaining card left' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card

      expect(deck.high_ranking_cards).to eq([card3])
    end

    it 'causes the percentage of high ranking cards to be 50.00' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card

      expect(deck.percent_high_ranking).to eq(50.00)
    end
  end

  describe '#add_card' do
    it 'adds a card to the bottom of the deck' do # I'm uncertain if this is the 'best' test, but it works
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card
      deck.add_card(card4)

      expect(deck.cards).to eq([card2, card3, card4])
    end

    it 'causes the deck to contain 3 cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card
      deck.add_card(card4)

      expect(cards.count).to eq(3)
    end

    it 'causes there to still have one high ranking card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card
      deck.add_card(card4)

      expect(deck.high_ranking_cards).to eq([card3])
    end

    it 'causes the percentage of high ranking cards to be 33.33' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.remove_card
      deck.add_card(card4)
      
      expect(deck.percent_high_ranking).to eq(33.33)
    end
  end
end
