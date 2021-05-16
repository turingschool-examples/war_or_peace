require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do

  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:hear, 'Ace', 14)

    @deck = Deck.new([@card1, @card2, @card3])

    @player = Player.new('Clarisa', @deck)
  end

  it "has a player" do
    expect(@player).to be_an_instance_of(Player)
  end

  it "has an attr reader" do
    expect(@player.name).to eq('Clarisa')
    expect(@player.deck).to eq(@deck)
  end

  it "has lost?" do
    expect(@player.has_lost?).to eq(false)
  end

  it "remove card and has lost 1?" do
    expect(@player.deck.remove_card).to eq(@card1)
    expect(@player.has_lost?).to eq(false)
  end

  it "remove card and has lost 2?" do
    @player.deck.remove_card

    expect(@player.deck.remove_card).to eq(@card2)
    expect(@player.has_lost?).to eq(false)
  end

  it "remove card and has lost 3?" do
    @player.deck.remove_card
    @player.deck.remove_card

    expect(@player.deck.remove_card).to eq(@card3)
    expect(@player.has_lost?).to eq(true)
    expect(@player.deck).to eq(@deck)
  end
end

#  require 'pry'; binding.pry
