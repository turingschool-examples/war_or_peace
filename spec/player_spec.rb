require 'rspec'
require './lib/player'
require './lib/deck'
require './lib/card'

RSpec.describe Player do
  before do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Kind', 13)
    @card3 = Card.new(:diamond, 'Nine', 9)
    deck = [@card1, @card2, @card3]
    @player = Player.new('Clarisa', @deck)
  end

  it 'exists' do
    expect(@player).to be_an_instance_of(Player)
  end

end
