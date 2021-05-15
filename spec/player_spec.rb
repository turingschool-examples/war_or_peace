require 'rspec'
require './lib/player'
require './lib/deck'
require './lib/card'

RSpec.describe Player do
  before (:each)do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Kind', 13)
    @card3 = Card.new(:diamond, 'Nine', 9)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Clarisa', @deck)
  end

  it 'exists' do
    expect(@player).to be_an_instance_of(Player)
  end

  it 'has deck' do
    expect(@player.deck).to eq(@deck)
  end

  it 'has lost?' do
    expect(@player.has_lost?).to eq(false)
  end

  it 'Can remove card from deck' do
    @player.deck.remove_card
    expect(@deck.cards).to eq([@card2, @card3])
  end

  it 'Can lose when no cards in deck' do
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(true)
  end


end
