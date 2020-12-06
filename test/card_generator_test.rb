 require 'minitest/autorun'
 require 'minitest/pride'
 require './lib/card_generator.rb'

 class CardGeneratorTest < Minitest::Test

 def test_it_exists
   filename = 'cards.txt'
   card_generator = CardGenerator.new(filename)
 assert_instance_of CardGenerator, card_generator
 end

 def test_for_file
   # skip
   filename = 'cards.txt'
   card_generator = CardGenerator.new(filename)
 assert_equal'cards.txt', filename
 end

 def test_for_cards_in_file
   # skip
   filename = 'cards.txt'
   cards = CardGenerator.new(filename).cards
   assert_equal 52, cards.length
 end
end
