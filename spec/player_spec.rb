require 'rspec'
require 'card.rb'
require 'deck.rb'
require 'player.rb'

RSpec.describe Player do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(card)
    player = Player.new('name', deck)

    expect(player).to be_an_instance_of(Player)
  end
end
