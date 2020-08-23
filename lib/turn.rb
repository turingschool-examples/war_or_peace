require "pry"

class Turn

  attr_reader :player1, :player2, :spoils_of_war, :winner, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
    @type = set_type
  end

  def set_type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @type = :basic
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) &&
          (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      @type = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @type = :war
    end
  end

  def winner
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @winner = player1
      elsif player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
        @winner = player2
      end
    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @winner = player1
      elsif player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
        @winner = player2
      end
    elsif @type == :mutually_assured_destruction
      @winner = "No Winner"
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << player1.deck.cards[0]
      player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards[0]
      player2.deck.cards.shift
    elsif @type == :war
      [@player1, @player2].each do |player|
       3.times {@spoils_of_war << player.deck.remove_card}
      end
      p spoils_of_war
    end
  end

  def awards_spoils(winner)
    if @type == :basic && @winner == player1
      player1.deck.cards << spoils_of_war[0]
      player1.deck.cards << spoils_of_war[1]
    elsif @type == :basic && @winner == player2
      player2.deck.cards << spoils_of_war[0]
      player2.deck.cards << spoils_of_war[1]
    elsif @type == :war && @winner == player1
      until spoils_of_war.empty?
      player1.deck.cards << test_spoils_of_war
      end
    elsif @type == :war && @winner == player2
      until spoils_of_war.empty?
      player1.deck.cards << @spoils_of_war
      end
    elsif @type == :mutually_assured_destruction
      discarded_cards = []
      discarded_cards << @spoils_of_war
    end
  end

end
