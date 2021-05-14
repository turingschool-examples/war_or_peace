require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  before do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Clarisa', @deck)
  end

  it 'exists' do
    expect(@player).to be_a(Player)
  end

  it 'has name' do
    expect(@player.name).to eq('Clarisa')
  end

  it 'has deck' do
    expect(@player.deck).to eq(@deck)
  end

  it 'has lost?' do
    expect(@player.has_lost?).to eq(false)
  end
end
