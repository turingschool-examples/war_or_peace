require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'

describe Deck do
  before(:each) do#tells my it statements to place this code below before them so i dont
    #have to type it out everytime
    @card1 = Card.new(:diamond, 'Queen', 12)#creating instances of the card class
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]#assembling cards into an array called cards

    @deck = Deck.new(@cards)
  end

  it 'deck with cards' do#saying he this is a deck with cards right?
    expect(@deck).to be_an_instance_of(Deck)#giving it what to look at to answer my question above
    expect(@deck.cards).to eq([@card1, @card2, @card3])#answering for the fact that my deck does have cards
  end

  it 'rank cards' do#saying hey does it rank cards?

  expect(@deck.rank_of_card_at(0)).to eq(12)#saying yeah if you look at my deck it will rank my cards in the array
  expect(@deck.rank_of_card_at(2)).to eq(14)#calling to the ace of hearts in my @deck
  end

  it 'have high ranking cards' do#does this have high ranking cards?

  expect(@deck.high_ranking_cards.length).to eq(2)#yes you should see 2 high ranking cards in my deck
  #the queen and the ace.length gives back instances even in arrays

  end

  it 'know the percentage of high ranking cards' do# does it know the percentage of high cards?

  expect(@deck.percent_high_ranking_cards).to eq(66.67)
  end

it 'will remove cards' do#will it remove cards?

@deck.remove_card#calling method to remove a card
  expect(@deck.cards).to eq([@card2 ,@card3])#calling the array that will now show @card1 has been removed

end
it 'will add cards' do#will it add cards?

@deck.remove_card#remove first because my each do gives me the original array which has @card1 in it

  card4 = Card.new(:club, '5', 5)#creating a new iteration to my @cards
  @deck.add_card(card4)
  expect(@deck.cards).to eq([@card2, @card3, card4])#the new array with @card1 gone and a ADDED card of card4
  end
end
