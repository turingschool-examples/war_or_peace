require 'rspec'
require './lib/card.rb'
require 'deck.rb'
require 'player.rb'
require 'turn.rb'

RSpec.describe Turn do
  it "exists" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:diamond, '6',6)
    deck_1 = Deck.new(card_1)
    deck_2 = Deck.new(card_2)
    player_1 = Player.new('name_1', deck_1)
    player_2 = Player.new('name_2', deck_2)
    turn = Turn.new(player_1, player_2)

    expect(turn).to be_an_instance_of(Turn)
  end
end
