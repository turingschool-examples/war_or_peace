class Turn

  attr_reader :spoils_of_war,
              :player1,
              :player2

  def initialize(player1, player2)
    @spoils_of_war = []
    @player1 = player1
    @player2 = player2
  end

def type
  if player1.deck.rank_of_card_at(0) ==
     player2.deck.rank_of_card_at(0) &&
     player1.deck.rank_of_card_at(2) ==
     player2.deck.rank_of_card_at(2)
     :mutually_assured_destruction
  elsif player1.deck.rank_of_card_at(0) !=
        player2.deck.rank_of_card_at(0)
        :basic
  elsif player1.deck.rank_of_card_at(2)!=
        player2.deck.rank_of_card_at(2)
        :war
  end
end

def winner
    case self.type
    when :basic
      if player1.deck.rank_of_card_at(0) >
        player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    when :war
      if player1.deck.rank_of_card_at(2) >
        player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else
      "No winner"
    end
end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
      end
      3.times do
        @spoils_of_war << player2.deck.remove_card
      end
      @spoils_of_war
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
      end
      3.times do
        player2.deck.remove_card
      end
      @spoils_of_war
    else
      @spoils_of_war << player1.deck.cards
      @spoils_of_war << player2.deck.cards
      @spoils_of_war.flatten!
    end
  end

  def award_spoils(winner)
      winner.deck.cards << @spoils_of_war
      @spoils_of_war.clear
      winner.deck.cards.flatten!
  end

end
