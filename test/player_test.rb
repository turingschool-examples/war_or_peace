require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    player = Player.new('Clarisa', deck)
  end
