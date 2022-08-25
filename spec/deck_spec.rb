require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do 
  it "exists" do 
    # deck = Deck.new([])
    # expect(deck.cards).to eq([])

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([])
    expect(deck.cards).to eq([])
    expect(card1).to be_an_instance_of(Card)
    expect(card2).to be_an_instance_of(Card)
    expect(card3).to be_an_instance_of(Card)

    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)

    expect(deck.cards).to eq([card1, card2, card3])

  end 
  it '#rank of card at index location' do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([])
    
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)

    expect(deck.cards).to eq([card1, card2, card3])
    expect(deck.cards.find_index(card1)).to eq(0)
    expect(deck.cards.find_index(card2)).to eq(1)
    expect(deck.cards).to eq([card1, card2, card3])

  #  require 'pry'; binding.pry  
    expect(card1.rank).to eq(12)
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end 

  it 'tests #high ranking cards' do 
    # @card1 = Card.new(:diamond, 'Queen', 12)
    # @card2 = Card.new(:spade, '3', 3)
    # @card3 = Card.new(:heart, 'Ace', 14)
    # cards = [@card1, @card2, @card3]
    # deck = Deck.new(cards)  
    

    # expect(deck.cards).to eq([@card1, @card2, @card3])
    #_______________________________
   
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([])
    

    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)

    expect(deck.cards).to eq([card1, card2, card3])

    expect(deck.cards.find_index(card2)).to eq(1)

 
  end 

 

end 