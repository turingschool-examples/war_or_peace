require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

describe Game do
  it 'exists' do
    game = Game.new('Megan', 'Aurora')
    expect(game).to be_an_instance_of(Game)
  end

  it 'splits the deck to player1 and player2' do
    game = Game.new('Megan', 'Aurora')
    game.build_deck
    game.shuffule_and_split

    expect(game.deck1.cards.legnth).to eq(26)
  end
end
