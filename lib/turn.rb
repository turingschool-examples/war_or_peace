require './lib/player'

class Turn
  attr_accessor :player1,
                :player2,
                :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    player1_rank0 = player1.deck.rank_of_card_at(0)
    player2_rank0 = player2.deck.rank_of_card_at(0)

    player1_rank2 = player1.deck.rank_of_card_at(2)
    player2_rank2 = player2.deck.rank_of_card_at(2)

    if player1_rank0 == player2_rank0 && player1_rank2 == player2_rank2
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    else
      return :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      return 'No Winner'
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      else
        return player2
      end
    elsif type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      else
        return player2
      end
    end
  end
  def pile_cards
  if type == :mutually_assured_destruction
    player1.deck.cards.slice!(0..2)
    player2.deck.cards.slice!(0..2)
  elsif type == :war
      @spoils_of_war += player1.deck.cards.values_at(0..2)
      player1.deck.cards.slice!(0..2)

      @spoils_of_war += player2.deck.cards.values_at(0..2)
      player2.deck.cards.slice!(0..2)
  elsif type == :basic
      @spoils_of_war << player1.deck.cards[0]
      player1.deck.cards.slice!(0)


      @spoils_of_war << player2.deck.cards[0]
      player2.deck.cards.slice!(0)
    end
  end

  def award_spoils
    if winner == player1
      player1.deck.cards << @spoils_of_war
    else
      player2.deck.cards << @spoils_of_war
  end
end
end
