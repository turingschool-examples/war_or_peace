require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

RSpec.describe Game do
  it 'exists' do
    game = Game.new('Basil', 'Thyme')

    expect(game).to be_an_instance_of(Game)
  end

  it 'can create decks' do
    game = Game.new('Basil', 'Thyme')

    expect(game.create_deck).to be_an_instance_of(Deck)
  end

  it 'can put cards into decks' do
    game = Game.new('Basil', 'Thyme')

    game.create_deck
    game.split_deck
    binding.pry
  end

end
