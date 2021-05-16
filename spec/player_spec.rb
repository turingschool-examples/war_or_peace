require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  it 'has new player' do

    expect(@player).to be_an_instance_of(Player)
    expect(@player.name).to eq('Clarisa')

  end

  it 'has a deck with cards' do

    expect(@player.deck).to be_an_instance_of(Deck)

  end

  it 'can play a round of war' do

    expect(@player.has_lost?).to eq false
    expect(@player.deck.remove_card).to eq(@card1)

  end

  it 'can play another round of war' do
    @player.deck.remove_card

    expect(@player.has_lost?).to eq false
    expect(@player.deck.remove_card).to eq(@card2)
  end

  it 'can play a third round of war' do
    @player.deck.remove_card
    @player.deck.remove_card

    expect(@player.has_lost?).to eq false
    expect(@player.deck.remove_card).to eq(@card3)
  end

  it 'can lose round of war' do
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card

    expect(@player.has_lost?).to eq true
    expect(@player.deck.cards).to be_empty
  end
end
