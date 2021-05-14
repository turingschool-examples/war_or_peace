require './lib/card'
require './lib/game'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  xit 'can create its own objects' do
      game = Game.new
      card = Card.new

      game.add_diamond_card
      card.
  end

  end
end
