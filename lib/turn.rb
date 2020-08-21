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
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
     :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner # will determine the winner of the turn, compare the types, to determine the winner (look @ structure of code)
    if self.type == :mutually_assured_destruction
      winner = 0# no winner
    elsif turn :war
      winner = 0# player with higher rank_of_card_at(2)
    else turn :basic
      winner = 0# player with the higher rank_of_card_at(0)
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
