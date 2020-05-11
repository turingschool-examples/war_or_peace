require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @basic_turn_deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @basic_turn_deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @basic_turn_player1 = Player.new("Megan", @basic_turn_deck1)
    @basic_turn_player2 = Player.new("Aurora", @basic_turn_deck2)

    # @basic_turn = Turn.new(@basic_turn_player1, @basic_turn_player2)

    @war_turn_deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @war_turn_deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @war_turn_player1 = Player.new("Megan", @war_turn_deck1)
    @war_turn_player2 = Player.new("Aurora", @war_turn_deck2)

    # @war_turn = Turn.new(@war_turn_player1, @war_turn_player2)

    @mad_card6 = Card.new(:diamond, '8', 8)

    @mad_turn_deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @mad_turn_deck2 = Deck.new([@card4, @card3, @mad_card6, @card7])

    @mad_turn_player1 = Player.new("Megan", @mad_turn_deck1)
    @mad_turn_player2 = Player.new("Aurora", @mad_turn_deck2)

    # @mad_turn = Turn.new(@mad_turn_player1, @mad_turn_player2)
  end

  def test_it_exists
    @basic_game = Game.new(@basic_turn_player1, @basic_turn_player2)
    @war_game = Game.new(@war_turn_player1, @war_turn_player2)
    @mad_game = Game.new(@mad_turn_player1, @mad_turn_player2)
    assert_instance_of Game, @basic_game
    assert_instance_of Game, @war_game
    assert_instance_of Game, @mad_game
  end

  def test_it_welcomes_you_to_game_upon_start
  end

  def test_it_prompts_user_to_type_go_to_start_game
  end

  def test_there_is_a_game_winner
  end

  def test_

  end
end
