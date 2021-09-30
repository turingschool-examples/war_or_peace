require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  before :each do

  end

  it 'exists' do
    player = Player.new("Sally", Deck.new)
  end
  
  it 'has attributes' do
    player = Player.new("Sally", Deck.new)
    expect(player.name).to eq("Sally")
    expect(player.deck).to be_a(Deck)
    expect(player.deck.cards.size).to eq(52)
  end
  
  it 'has_lost' do
    card1 = Card.new(:diamond, "Two", 2)
    card2 = Card.new(:diamond, "Three", 3)
    card3 = Card.new(:diamond, "Four", 4)
    cards = [card1, card2, card3]
    player = Player.new("Sally", Deck.new(cards))
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(true)
  end
end