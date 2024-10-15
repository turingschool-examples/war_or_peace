class Turn
attr_reader :player1, :player2, :spoils_of_war

def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  @spoils_of_war = spoils_of_war = []
end
initialize: A Turn is created with two players - player1 and player2

def type

type: a turn is :basic, :war, or :mutually_assured_destruction.
A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
A :war turn occurs when both players’ rank_of_card_at(0) are the same.
:mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.

def winner
  if type :basic 
    winner = player1.deck.rank_of_card_at(0)
  elseif type :war
    winner = player1.deck.rank_of_card_at(2)
  elseif type :mutually_assured_destruction
    No Winner
winner: this method will determine the winner of the turn.
if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
if the turn has a type of :mutually_assured_destruction the method will return No Winner.
end

def pile_cards
  if type :basic
    player1.deck.remove_card(0) >> spoils_of_war
    player2.deck.remove_card(0) >> spoils_of_war
  elseif type :war
    player1.deck.remove_card(0, 1, 2) >> spoils_of_war
    player2.deck.remove_card(0, 1, 2) >> spoils_of_war
  elseif type :mutually_assured_destruction
    player1.deck.remove_card(0, 1, 2)
    player2.deck.remove_card(0, 1, 2)
  end
end


  

  def award_spoils
    spoils_of_war >> winner.deck ?
  end
 