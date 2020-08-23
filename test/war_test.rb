require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/standarddeck'
require './lib/war'

class WarTest < Minitest::Test

  def test_it_exists
    war = War.new

    assert_instance_of War, war

  end

  def test_it_has_attributes
  end
end
