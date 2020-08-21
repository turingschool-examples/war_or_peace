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
      nil
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1.name
      else
        player2.name
      end
    else
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1.name
      else
        player2.name
      end
    end
  end

# sends cards from players decks into spoils_of_war array
  def pile_cards
    # both players remove top 3 cards in their deck, removed from deck.
    # Not sent to spoils_of_war array(simply removed)
    if type == :mutually_assured_destruction && winner == nil
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif type == :war
      if turn.winner = player1.name
        spoils_of_war << 3.times {player1.deck.cards.pop}
      else turn.winner = player2.name
        spoils_of_war << 3.times {player2.deck.cards.pop}
      end
    else
      spoils_of_war << player1.deck.pop
      spoils_of_war << player2.deck.pop
    end
  end

  def award_spoils
    if turn.winner = player1.name
      player1.deck << spoils_of_war.slice!(0..-1)
    elsif turn.winner = player2.name
      player2.deck << spoils_of_war.slic!(0..-1)
    else
      'no winners in mutually_assured_destruction'
    end
  end
end
