require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "deck_of_cards.txt"
    card_gen = CardGenerator.new(filename)

    assert_instance_of CardGenerator, card_gen
  end


  def test_it_can_read_my_file
    filename = "deck_of_cards.txt"
    card_gen = CardGenerator.new(filename)
    assert_equal "deck_of_cards.txt", card_gen.filename
    # Didn't work...
    # Error: filename isn't a method...
    # I've initialized it. GOT IT! I didn't let my file 'get' it!
    # Fixed! Perfect.
  end

  def test_class_can_open_an_array_to_hold_txt_lines
    filename = "deck_of_cards.txt"
    card_gen = CardGenerator.new(filename)
    assert_equal [], card_gen.cards
    # Oops, didn't initialize or access cards!
  end

  # Have to research reading files
  # This might be a while...
  # Need to find something that can open the file
  # THEN, it should read the first line, convert it to an array element
  # THEN, add into array

  def test_can_open_and_read_file
    filename = "deck_of_cards.txt"
    card_gen = CardGenerator.new(filename)
    # assert_equal [], card_gen.read_generator
  end

  def test_random_lines
    filename = "deck_of_cards.txt"
    card_gen = CardGenerator.new(filename)
    generator = card_gen.read_generator
    assert_equal "club, 'Two', 2", generator[0]
    assert_equal "diamond, 'Three', 3", generator[14]
    assert_equal "heart, 'Four', 4", generator[28]
    assert_equal "spade, 'King', 13", generator[50]
  end

  # Now I need to test card class can create instance from file array
  def test_turn_into_array
    filename = "deck_of_cards.txt"
    card_gen = CardGenerator.new(filename)
    # assert_equal [], card_gen.turn_into_array
  end

  def test_cards_are_correct
    filename = "deck_of_cards.txt"
    card_gen = CardGenerator.new(filename)
    card_gen.turn_into_array
    #Line 10 - index 9
    test_card1 = Card.new(:club, "Jack", 11)
    #Line 26 - index 25
    test_card2 = Card.new(:diamond, "Ace", 14)
    assert_equal test_card1, card_gen.cards[9]
    assert_equal test_card2, card_gen.cards[25]
  end

end
