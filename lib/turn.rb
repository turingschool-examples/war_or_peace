class Turn

attr_reader :player1, :player2, :spoils_of_war

def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  @spoils_of_war = []
end

def type
  if player1.deck.cards.rank_of_card_at(0) != player2.deck.cards.rank_of_card_at(0) # when decks are not of the same rank
    turn_type = :basic
  else if player1.deck.cards.rank_of_card_at(0) == player2.deck.cards.rank_of_card_at(0) # if rank is the same then war occurs
    turn_type = :war
  else
    turn_type = :mad
  end

def winner
  while turn_type == :basic do
    if player1.deck.cards.rank_of_card_at(0) > player2.deck.cards.rank_of_card_at(0)
      return player1
    else
      return player2
    end
  end
  while turn_type == :war do
    if player1.deck.cards.rank_of_card_at(2) > player2.deck.cards.rank_of_card_at(2)
      return player1
    else
      return player2
    end
  end
  if turn_type == :mad
      print "no winners"
  end

# def pile_cards
#   while turn_type == :basic do
#     spoils_of_war.player1.deck.cards.unshift
#     spoils_of_war.player2.deck.cards.unshift
#   else do
#     turn_type == :basic
#     spoils_of_war.player1.deck.cards.unshift
#     spoils_of_war.player2.deck.cards.unshift
#   end
#   end
end


end
