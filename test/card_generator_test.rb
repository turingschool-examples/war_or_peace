 require 'minitest/autorun'
 require 'minitest/pride'
 require './lib/card_generator.rb'

 class CardGeneratorTest < Minitest::Test

 def test_it_exists
   filename = File.new "cards.txt"
   filename = File.open("cards.txt", "r")
   card_generator = CardGenerator.new(filename)
 assert_instance_of CardGenerator, card_generator
 end

 def test_for_file
   # skip
   filename = File.new "cards.txt"
   filename = File.open("cards.txt", "r")
   card_generator = CardGenerator.new(filename)
 assert_instance_of File, filename
 end

 def test_for_cards_in_file
   skip
   filename = File.new "cards.txt"
   filename = File.open("cards.txt", 'r')
   cards = CardGenerator.new(filename).cards
   assert_equal 52, cards.length
 end
end
