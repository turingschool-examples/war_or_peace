require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

   def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)


    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
   end

  def test_it_exists
    assert_instance_of Player, @player1
    assert_instance_of Player, @player2
    assert_instance_of Deck, @deck1
    assert_instance_of Deck, @deck2
  end

   def test_turn_exists

     turn = Turn.new(@player1, @player2)
     turn.player1
     turn.player2
     assert_instance_of Turn, turn
   end
#
   def test_type

     turn = Turn.new(@player1, @player2)
     turn.player1
     assert_equal @player1, turn.player1
     turn.player2
     assert_equal @player2, turn.player2
   end

   def test_spoils_of_war
     turn = Turn.new(@player1, @player2)
     assert_equal [], turn.spoils_of_war
   end

   def test_what_type
      turn = Turn.new(@player1, @player2)
      assert_equal :basic, turn.type
   end


  def test_winner
    turn = Turn.new(@player1, @player2)
    turn.player1
    turn.player2
    turn.type
    assert_equal @player1, turn.winner

    @player1 = Player.new("Megan", @deck2)
    @player2 = Player.new("Aurora", @deck1)
    turn = Turn.new(@player1, @player2)
    turn.player1
    turn.player2
    turn.type
    assert_equal @player2, turn.winner

    @deck1 = Deck.new([@card1, @card2, @card3])
    @deck2 = Deck.new([@card4, @card5, @card6])
    @player1 = Player.new("Megan", @deck2)
    @player2 = Player.new("Aurora", @deck1)
    turn = Turn.new(@player1, @player2)
    turn.player1
    turn.player2
    turn.type
    assert_equal @player1, turn.winner

    @deck1 = Deck.new([@card1, @card2, @card3])
    @deck2 = Deck.new([@card4, @card5, @card3])
    @player1 = Player.new("Megan", @deck2)
    @player2 = Player.new("Aurora", @deck1)
    turn = Turn.new(@player1, @player2)
    turn.player1
    turn.player2
    turn.type
    assert_equal "No winner", turn.winner


  end

  def test_pile_cards
    turn = Turn.new(@player1, @player2)
    turn.player1
    turn.player2
    turn.type
    turn.pile_cards
    assert_equal turn.spoils_of_war, turn.pile_cards


    @deck1 = Deck.new([@card1, @card2, @card3, @card7])
    @deck2 = Deck.new([@card4, @card5, @card3, @card8])
    @player1 = Player.new("Megan", @deck2)
    @player2 = Player.new("Aurora", @deck1)
    turn = Turn.new(@player1, @player2)
    turn.player1
    turn.player2
    turn.type
    turn.winner
    turn.pile_cards
    assert_equal [@card7], @player2.deck.cards
    #mutually_assured_destruction

    @deck1 = Deck.new([@card1, @card2, @card3])
    @deck2 = Deck.new([@card4, @card5, @card6])
    @player1 = Player.new("Megan", @deck2)
    @player2 = Player.new("Aurora", @deck1)
    turn = Turn.new(@player1, @player2)
    turn.player1
    turn.player2
    turn.type
    assert_equal turn.spoils_of_war, turn.pile_cards
  end

  def test_award_spoils
    #skip
    # @deck1 = Deck.new([@card1, @card2, @card3])
    # @deck2 = Deck.new([@card4, @card5, @card6])
    # @player1 = Player.new("Megan", @deck1)
    # @player2 = Player.new("Aurora", @deck2)
    # turn = Turn.new(@player1, @player2)
    # turn.player1
    # turn.player2
    # turn.type
    # turn.winner #player2
    # winner = turn.winner

    # card1 = Card.new(:heart, 'Jack', 11)
    # card2 = Card.new(:heart, '10', 10)
    # card3 = Card.new(:heart, '9', 9)
    # card4 = Card.new(:diamond, 'Jack', 11)
    # card5 = Card.new(:heart, '8', 8)
    # card6 = Card.new(:diamond, 'Queen', 12)
    # card7 = Card.new(:heart, '3', 3)
    # card8 = Card.new(:diamond, '2', 2)
    # deck1 = Deck.new([card1, card2, card8])
    # deck2 = Deck.new([card3, card4, card7])
    player1 = Player.new("Megan", @deck1)
    player2 = Player.new("Aurora", @deck2)
    turn = Turn.new(@player1, @player2)

    turn.type
    turn.winner
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    assert_equal @player2.deck.cards, [@card4, @card6, @card7] #card4, card6, card7,]#winner.deck.cards.concat(spoils_of_war)
    assert_equal @player1.deck.cards, [@card2, @card5, @card8, @card1, @card3]
  end

  def test_war_spoils
    @card1 = Card.new(:heart, 'Jack', 11) #
    @card2 = Card.new(:heart, '10', 10) #
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12) #
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2) #
    @deck1 = Deck.new([@card1, @card2, @card6, @card8])
    @deck2 = Deck.new([@card4, @card3, @card5, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    turn = Turn.new(@player1, @player2)
    turn.type
    turn.winner
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    assert_equal @player1.deck.cards, [@card8, @card1, @card2, @card6, @card4, @card3, @card5]
    assert_equal @player2.deck.cards, [@card7]
  end

    def test_mutual_loss
      @card1 = Card.new(:heart, 'Jack', 11) #
      @card2 = Card.new(:heart, '10', 10) #
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12) #
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 3) #
      @deck1 = Deck.new([@card1, @card2, @card7, @card5])
      @deck2 = Deck.new([@card4, @card3, @card8, @card6])
      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)
      turn = Turn.new(@player1, @player2)
      turn.type
      turn.winner
      winner = turn.winner
      turn.pile_cards
      #turn.award_spoils(winner)
      assert_equal @player1.deck.cards, [@card5]
      assert_equal @player2.deck.cards, [@card6]
    end



  end


 #
 require './lib/deck'
 require './lib/card'
 require './lib/player'
 require './lib/turn'
 @card1 = Card.new(:heart, 'Jack', 11) #
 @card2 = Card.new(:heart, '10', 10) #
 @card3 = Card.new(:heart, '9', 9)
 @card4 = Card.new(:diamond, 'Jack', 11)
 @card5 = Card.new(:heart, '8', 8)
 @card6 = Card.new(:diamond, 'Queen', 12) #
 @card7 = Card.new(:heart, '3', 3)
 @card8 = Card.new(:diamond, '2', 2) #
 @deck1 = Deck.new([@card1, @card2, @card6, @card8])
 @deck2 = Deck.new([@card4, @card3, @card5, @card7])
 @player1 = Player.new("Megan", @deck1)
 @player2 = Player.new("Aurora", @deck2)
 turn = Turn.new(@player1, @player2)
 turn.type
 turn.winner
 winner = turn.winner
 turn.pile_cards
 turn.award_spoils(winner)














 @card1 = Card.new(:heart, 'Jack', 11) #
 @card2 = Card.new(:heart, '10', 10) #
 @card3 = Card.new(:heart, '9', 9)
 @card4 = Card.new(:diamond, 'Jack', 11)
 @card5 = Card.new(:heart, '8', 8) #
 @card6 = Card.new(:diamond, 'Queen', 12)
 @card7 = Card.new(:heart, '3', 3)
 @card8 = Card.new(:diamond, '2', 2) #
@deck1 = Deck.new([@card1, @card2, @card6, @card8])
 @deck2 = Deck.new([@card4, @card3, @card5, @card7])
  @player1 = Player.new("Megan", @deck1)
 @player2 = Player.new("Aurora", @deck2)
 turn = Turn.new(@player1, @player2)

 turn.type
 turn.winner
 winner = turn.winner
 turn.pile_cards
 turn.award_spoils(winner)









 card1 = Card.new(:heart, 'Jack', 11)
 card2 = Card.new(:heart, '10', 10)
 card3 = Card.new(:heart, '9', 9)
 card4 = Card.new(:diamond, 'Jack', 11)
 card5 = Card.new(:heart, '8', 8)
 card6 = Card.new(:diamond, 'Queen', 12)
 card7 = Card.new(:heart, '3', 3)
 card8 = Card.new(:diamond, '2', 2)
 deck1 = Deck.new([card1, card2, card8])
 deck2 = Deck.new([card3, card4, card7])
 player1 = Player.new("Megan", deck1)
 player2 = Player.new("Aurora", deck2)
 turn = Turn.new(player1, player2)

 turn.type
 turn.winner
 winner = turn.winner
 turn.pile_cards
 turn.award_spoils(winner)
