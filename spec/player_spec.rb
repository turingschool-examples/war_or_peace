require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  before(:each) do

    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(cards)

    @player = Player.new('Clarisa', deck)


  end

describe 'Test' do

  it "exists" do


    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    #
    # deck = Deck.new(cards)
    #
    # player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
    # require 'pry'; binding.pry
  end

  it "exists" do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [@card1, @card2, @card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    # require 'pry'; binding.pry
    #remove three cards and test to see if the player has lost each time
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    #require 'pry'; binding.pry
    expect(player.has_lost?).to eq(true)
    expect(player.deck.cards).to eq([])
    #player has lost, and the deck.cards is an empty array
    # require 'pry'; binding.pry
  end

 end
end
