require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  before :each do
    @player = Player.new('Clarissa', @deck)
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    # @cards = [@card1, @card2, @card3]
    @deck = Deck.new([@card1, @card2, @card3])
    @card4 = Card.new(:club, '5', 5)
  end

  it 'exists' do
    expect(@player).to be_a(Player)
  end

  it 'has a name' do
    expect(@player.name).to eq('Clarissa')
  end

  it 'holds a deck' do
    expect(@player.deck).to eq(@deck)
  end

  it 'loses' do
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card

    expect(@player.has_lost?).to eq(true)
  end
end
