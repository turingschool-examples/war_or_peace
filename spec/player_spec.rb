require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @card4 = Card.new(:club, '5', 5)
    @deck = Deck.new(@cards)
  end

  it "exists" do
    player = Player.new("Clarissa", @deck)
    expect(player).to be_instance_of(Player)
  end

  it "has a name" do
    player = Player.new("Clarissa", @deck)
    expect(player.name).to eq("Clarissa")
  end

  it "lost game" do
    player = Player.new("Clarissa", @deck)
    expect(player.deck.cards).to eq([@card1, @card2, @card3])
    player.deck.remove_card
    expect(player.deck.cards).to eq([@card2, @card3])
    expect(player.has_lost?).to eq false
    player.deck.remove_card
    expect(player.deck.cards).to eq([@card3])
    expect(player.has_lost?).to eq false
    player.deck.remove_card
    ›__expect(player.deck.cards).to eq([])
    expect(player.has_lost?).to eq true
  end
end
