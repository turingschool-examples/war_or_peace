class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
     player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      else player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
        return player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      elsif player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
        return player2
      end
    else type == :mutually_assured_destruction
      return "no winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card && @spoils_of_war << player2.deck.remove_card

    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card && @spoils_of_war << player2.deck.remove_card
      end

    else type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card && player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    if winner == "no winner"
      @spoils_of_war
    else
      winner.deck.cards << @spoils_of_war
    end
  end



  def start
    count = 0
  while player1.has_lost? == false || player2.has_lost? == false do

    count += 1

    award_spoils(winner)
    pile_cards
    winner


    if type == :basic
      p "Turn#{count}: #{winner.name} won 2 cards"

    elsif type == :war
      p "turn #{count}: #{winner.name} won 6 cards"

    else
      p "Turn #{count} *mutually assured destruction* 6 cards removed from play"
    end
  end

  end
end




  # end
