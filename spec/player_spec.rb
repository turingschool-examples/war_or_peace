require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

RSpec.describe Card do
  before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)  
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Clarisa', @deck)
  end 
  it "exists" do

    expect(@player).to be_an_instance_of(Player)
  end

  it "has readable attributes" do

    expect(@player.name).to eq('Clarisa')
    expect(@player.deck).to eq(@deck)
  end

  it "player hasn't lost by default" do

    expect(@player.has_lost?).to eq(false)
  end

  it "player lose after losing 3 cards" do

    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(true)
    expect(@player.deck.class).to eq(Deck)
  end
end 