require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Player do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new ([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  it 'player instance exists and is an instance of Player class' do
    expect(@player).to be_a(Player)
  end

  it 'returns instance attribute methods' do
    expect(@player.name).to eq("Clarisa")
    expect(@player.deck).to eq(@deck)
  end

  it 'returns correct boolean with #has_lost?' do
    expect(@player.has_lost?).to eq(false)
  end

  it 'returns correct boolean with #has_lost?' do
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)
  end

  it 'can run deck method within player class' do
    expect(@player.deck.remove_card).to eq(@card1)
  end

  it 'returns correct boolean with #has_lost? after cards removed' do
    expect(@player.has_lost?).to eq(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(true)
  end

end
