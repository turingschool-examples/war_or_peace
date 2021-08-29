require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'

RSpec.describe Turn do
  it 'exists' do
    game1 = Game.new
    expect(game1).to be_an_instance_of(Game)
  end

  xit 'has readable attributes' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)

    expect(card1.suit).to eq(:diamond)
    expect(card1.value).to eq('Queen')
    expect(card1.rank).to eq(12)

  end

end
