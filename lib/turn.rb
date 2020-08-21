class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
#infinite loop of turn class
# designate what the turn is with a case statement
# if you want things calculated dynamically, you want use to use a method, to keep it dynamic.
# an instance attribute is set. Not as dynamic as its fixed.
  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
     :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner # will determine the winner of the turn, compare the types, to determine the winner (look @ structure of code)
    if type == :mutually_assured_destruction
      winner = nil
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        winner = player1.name
      else
        winner = player2.name
      end
    else type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        winner = player1.name
      else
        winner = player2.name
      end
    end
  end

  def pile_cards # sends cards from players decks into spoils_of_war array (issue here. look @ turn, not a thing)
    if turn :mutually_assured_destruction
      # both players remove top 3 cards in their deck, removed from deck. Not sent to spoils_of_war array
    elsif turn :war
      # each player will send top 3 cards to spoils_of_war array
    else  turn :basic
      # each player sends top card to spoils_of_war array
    end
  end

  def award_spoils
    # adds cards from spoils_of_war array to winners deck array
  end

end
