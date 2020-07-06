require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card_generator'

class GeneratorTest < Minitest::Test



cards = CardGenerator.new("cards.txt")
require "pry"; binding.pry
end
