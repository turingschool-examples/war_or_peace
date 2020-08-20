class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    card_rank0 = [@player1, @player2].map do |player|
      # require "pry"; binding.pry
      player.deck.rank_of_card_at(0)
    end
    if card_rank0[0] != card_rank0[1]
      :basic
    elsif card_rank0[0] == card_rank0[1]
      card_rank2 = [@player1, @player2].map do |player|
        player.deck.rank_of_card_at(2)
      end
      if card_rank2[0] != card_rank2[1]
        :war
      else
        :mutually_assured_destruction
      end
    end
  end

  def winner
    if self.type == :basic
      card_rank0 = [@player1, @player2].sort_by do |player|
        player.deck.rank_of_card_at(0)
      end
      card_rank0[-1]
    elsif self.type == :war
      card_rank2 = [@player1, @player2].sort_by do |player|
        player.deck.rank_of_card_at(2)
      end
      card_rank2[-1]
    elsif self.type == :mutually_assured_destruction
      "No Winner"
    else           # REMOVE THIS ELSE STATEMENT BEFORE SUBMITTING
      "WINNER ERROR"
    end
  end

  def pile_cards
    @spoils_of_war = [@player1, @player2].map do |player|
      player.deck.remove_card
    end
  end

  def award_spoils(winner)
    winner.deck.cards = winner.deck.add_card(@spoils_of_war).flatten
  end
end
