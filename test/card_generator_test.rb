 require 'minitest/autorun'
 require 'minitest/pride'
 require './lib/card_generator.rb'

 class CardGeneratorTest < Minitest::Test

 def test_it_exists
   card_generator = CardGenerator.new
 assert_instance_of CardGenerator, card_generator
 end

 def test_for_attributes
   card_generator = CardGenerator.open("cards.txt")

# filename = "cards.txt"
 assert_equal "cards.txt", filename
 end

 def test_for_more_attributes
   skip
 assert_equal _, _
 end
end
