require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
  end

  it 'exists' do
    deck = Deck.new(@cards)
    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
  end

  it 'has a name' do
    deck = Deck.new(@cards)
    player = Player.new('Clarisa', deck)
    expect(player.name).to eq('Clarisa')
  end

  it 'has a deck' do
    deck = Deck.new(@cards)
    player = Player.new('Clarisa', deck)
    expect(player.deck).to eq(deck)
  end

  it 'has not lost by default' do
    deck = Deck.new(@cards)
    player = Player.new('Clarisa', deck)
    
    expect(player.has_lost?).to be(false)
    player.deck.remove_card

    expect(player.has_lost?).to be(false)
    player.deck.remove_card

    expect(player.has_lost?).to be(false)
    player.deck.remove_card

    expect(player.has_lost?).to be(true)
  end
end
