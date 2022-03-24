require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do
  before(:each ) do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([card1, card2, card5, card8])
    @deck2 = Deck.new([card3, card4, card6, card7])
    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)
    @turn = Turn.new(player1, player2)
  end

  it "exists" do
    expect(@player1).to be_an_instance_of(Player)
  end

  it "has readable attributes" do
    # @card = Card.new(:diamond, 'Queen', 12)
    # @card2 = Card.new(:spade, '3', 3)
    # @card3 = Card.new(:heart, 'Ace', 14)
    # @cards = [@card, @card2, @card3]
    # @deck = Deck.new(@cards)

    # expect(@deck.rank_of_card_at(0)).to eq('Queen')
    expect(@deck.rank_of_card_at(0)).to eq(12)
  end

  it "lists all high ranking cards" do
    expect(@deck.high_ranking_cards.length).to eq(2)
  end

  it "gives percentage of high ranking cards" do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it "removes card from top of deck" do
    expect(@deck.remove_card).to eq(@card)
  end

  it "adds card to bottom of deck" do
    @deck.add_card(@card4)
    expect(@deck.cards.length).to eq(4)
  end

end
