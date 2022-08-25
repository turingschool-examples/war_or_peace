require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe do 
  before(:each) do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14) 
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  #iteration 2 
  it 'exists' do 
    expect(@player).to be_instance_of Player 
  end

  it 'has a name' do 
    expect(@player.name).to eq('Clarisa')
  end

  it 'has a deck' do 
    expect(@player.deck).to eq(@deck)
  end

  it 'can tell when a player has lost' do 
    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card

    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card

    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card

    expect(@player.has_lost?).to eq(true)
  end  
end