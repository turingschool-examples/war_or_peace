require './lib/player'


class Turn

  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type#making to define my 3 turn types
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)#if the player1 card from the 0 index does not equal the player 2 card then the turns basic
     :basic
   elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)#if the players cards at the first and 3 position are equal then MAD
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)#if the players cards at the first index are equal then the turn is war
      :war
    end
  end

  def winner#gotta have a winner
    if type  == :basic#calling turn type from method above
        if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)#for basic whoever has the higher card at the 0 index wins
          return player1
        else
          return player2
        end
    elsif type == :war
        if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)#for war whoever has the higher card at the 2 index wins
          return player1
        else
          return player2
        end
      else type == :mutually_assured_destruction#when there is a tie during a war turn all 6 cards get discarded and no one wins anything
        return "No winner"
      end
  end


  def pile_cards#think of method like if this gets called what will it do?
    if type == :basic#turn is basic each player loses one card from there deck for the turn
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do#3 times do because you are giving 3 cards here the way the game actually works irl
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end
    else type == :mutually_assured_destruction
      3.times do#this is war but the 2 index card is also a tie and neither play will get any cards
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils#works with the above method to give out what cards are won each turn
    if winner == player1
      player1.deck.cards.concat(spoils_of_war)#concat takes my two arrays the deck and the spoils of war pot and puts them together giving it to the winner
    else#i know that if player1 didnt win it can literally only be player 2 who wins
      player2.deck.cards.concat(spoils_of_war)
    end
  end
end
