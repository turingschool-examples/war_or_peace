require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

describe Player do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
end

  it 'can have a new player' do

    expect(@player).to be_an_instance_of(Player)

  end

  it 'has lost!' do

      @deck.remove_card
      @deck.remove_card
      @deck.remove_card

    expect(@player.has_lost?).to be(true)

  end

  it 'removes cards' do
      @deck.remove_card
      expect(@deck.cards).to eq([@card2, @card3])
  end

end
