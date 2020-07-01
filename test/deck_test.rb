# requires minitest to enable gem
require 'minitest/autorun'
require 'minitest/nyan_cat'

# requires access to file Class deck and card
require './lib/card'
require './lib/deck'

# Syntax of using minitest for the DeckTest class
class DeckTest < Minitest::Test

# standard test to check it "it exists"
  def test_card_is_linked_and_exists
    # set variable 'card' equal to an instance of the Class Card with 3 parameters
    card = Card.new(:diamond, 'Queen', 12)

    # check if the result object (card instance) is an instance of the Class (Card Class)
    assert_instance_of Card, card
  end

  # test assigned attributes from Card Class and connect to Deck Class
  def test_it_has_readable_attributes
    # set three new instances
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    # set variable 'cards' equal to the array of instances created
    cards = [card_1, card_2, card_3]
    # create instance of the Deck class set equal to variable 'deck'
    deck = Deck.new(cards)
    # check to see if cards (the expected) is equal to deck.cards (the result)
    assert_equal cards, deck.cards
    # Opens pry after this line of code so I can play with this attributes test
    # require 'pry'; binding.pry
  end

  # test class method rank_of_card_at(index)
  def test_rank
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    # These tests may start to look similar. I can copy the above
    # to most tests below.

    # This will check if my card assigned from array index 0 (the first
    # value) is the correct rank of 11
    assert_equal 11, deck.rank_of_card_at(0)
    # Continue checking
    assert_equal 7, deck.rank_of_card_at(1)
    assert_equal 2, deck.rank_of_card_at(2)
    # To test this in live action (so to speak), I create a pry
    # require 'pry'; binding.pry

    # RESULTS of the pry! Successsssssss!
    # [1] pry(#<DeckTest>)> deck.rank_of_card_at(0)
    # => 11
    # [2] pry(#<DeckTest>)> deck.rank_of_card_at(1)
    # => 7
  end

  # test class method high_ranking_cards
  def test_high_rank
    card_1 = Card.new(:club, 'Jack', 11)
    card_2 = Card.new(:heart, 'Seven', 7)
    card_3 = Card.new(:spade, 'Two', 2)
    card_4 = Card.new(:diamond, 'King', 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)

    #Got confused here. Tried adding a pry, that didn't help.
    #Tried talking out loud in 'human speak', super helped.
    #Also looked at my Ind. Challenge from today and that guided me through
    #as I talked the code out loud.

    #attempted with array [11, 13], but that's not quite a printout of the card
    #pulled the error information and tried again
    #attempted with array [@suit=:club, @value="Jack", @rank=11>, @suit=:diamond, @value="King", @rank=13>], failed....
    #researching to attempt again.
    #Wow.... saying things out loud really helps...
    #I assigned all those parameters to a variable, I can just call on the variable!
    #Silly Priya
    assert_equal [card_1, card_4], deck.high_ranking_cards
  end

  # test class method percent_high_ranking
  # def test_remove
  #   card_1 = Card.new(:club, 'Jack', 11)
  #   card_2 = Card.new(:heart, 'Seven', 7)
  #   card_3 = Card.new(:spade, 'Two', 2)
  #   cards = [card_1, card_2, card_3]
  #   deck = Deck.new(cards)
  # end

  # test class method remove_card
  # def test_percentage
  #   card_1 = Card.new(:club, 'Jack', 11)
  #   card_2 = Card.new(:heart, 'Seven', 7)
  #   card_3 = Card.new(:spade, 'Two', 2)
  #   cards = [card_1, card_2, card_3]
  #   deck = Deck.new(cards)
  # end

  # test class method add_card(card)
  # def test_add
  #   card_1 = Card.new(:club, 'Jack', 11)
  #   card_2 = Card.new(:heart, 'Seven', 7)
  #   card_3 = Card.new(:spade, 'Two', 2)
  #   cards = [card_1, card_2, card_3]
  #   deck = Deck.new(cards)
  # end

end
