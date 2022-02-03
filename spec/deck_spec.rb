require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'

RSpec.describe 'Deck class'do
  it 'has a method "cards" that returns an array of Card instances' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    #returns an array...
    expect(deck.cards.class).to eq(Array)
    #... of Card instances
    deck.cards.each do |card|
      expect(card).to be_an_instance_of(Card)
    end
  end

  it 'has a method "rank_of_cards" that returns the rank of the card at the given index of the deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "has a method 'high_ranking_cards' that returns an array of the cards who's rank is at least 11" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    deck.high_ranking_cards.each do |card|
      expect(card.rank).to be > 10
    end
  end

  it "has a function 'percent_high_ranking' that returns percentage of high ranking cards in the deck as a float" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "has a function 'remove_card' that removes the first card from the deck array" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expected_deck = deck.cards[1..2]
    #forcing expected_high_value_cards to array format with brackets because accessing just one element returns just the element, no longer in an array, which our method needs to do!
    expected_high_value_cards = [deck.cards[2]]
    expected_high_value_percent = 50.00
    deck.remove_card

    expect(deck.cards).to eq(expected_deck)
    expect(deck.high_ranking_cards).to eq(expected_high_value_cards)
    expect(deck.percent_high_ranking).to eq(expected_high_value_percent)
  end

end


#LEGACY CODE
# #I know it's possible to test whether deck.rb requires
# describe '#deck' do
#   it 'Creates new instances of Card class' do
#     #setup
#     card1 = Card.new(:diamond,'Queen', 12)
#     #execution
#     #Assertion
#     expect(card1).to be_an_instance_of(Card)
#   end
#   it 'Creates a new instance of Deck with a cards atribute that is an array of cards' do
#     #setup
#     card1 = Card.new(:diamond,'Queen', 12)
#     card2 = Card.new(:spade, '3', 3)
#     card3 = Card.new(:heart, 'Ace', 14)
#     cards = [card1, card2, card3]
#     #execution
#     deck = Deck.new(cards)
#     #assert
#     expect(deck).to be_an_instance_of(Deck)
#   end
# end
#   describe '#cards' do
#     it 'Creates an attribute "cards" that is an array of Card instances' do
#       #setup
#       card1 = Card.new(:diamond,'Queen', 12)
#       card2 = Card.new(:spade, '3', 3)
#       card3 = Card.new(:heart, 'Ace', 14)
#       cards = [card1, card2, card3]
#       #execution
#       deck = Deck.new(cards)
#       #assert
#       expect(cards.class).to eq(Array)
#       cards.each do |card|
#         expect(card).to be_an_instance_of(Card)
#       end
#     end
#     #setup
#     card1 = Card.new(:diamond,'Queen', 12)
#     card2 = Card.new(:spade, '3', 3)
#     card3 = Card.new(:heart, 'Ace', 14)
#     cards = [card1, card2, card3]
#     deck = Deck.new(cards)
#     describe '#high_ranking_cards' do
#       it "outputs an array who's elements are all of rank 11 or higher" do
#         #why this no work tho!?
#
#         deck.high_ranking_cards.each do |card|
#           expect(card).to be_an_instance_of(Card)
#           expect(card.rank).to be >= 11
#       end
#     end
#   end
# end
