
require 'simplecov'
require 'rspec'

SimpleCov.start do
  add_filter './lib/game.rb'
end

require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
