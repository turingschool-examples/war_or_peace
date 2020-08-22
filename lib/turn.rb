class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    # @turn_winner
  end

  def type
    if(self.player1.deck.rank_of_card_at(0) == self.player2.deck.rank_of_card_at(0)) &&
      (self.player1.deck.rank_of_card_at(2) == self.player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif self.player1.deck.rank_of_card_at(0) == self.player2.deck.rank_of_card_at(0)
      :war
    elsif self.player1.deck.rank_of_card_at(0) != self.player2.deck.rank_of_card_at(0)
      :basic
    end
  end
# this has to be ran through each time to reset @turn_winner, otherwise award_spoils
#will keep shoveling spoils_of_war into original @turn_winner
  def winner
    if self.type == :basic && self.player1.deck.rank_of_card_at(0) > self.player2.deck.rank_of_card_at(0) ||
      self.type == :war && self.player1.deck.rank_of_card_at(2) > self.player2.deck.rank_of_card_at(2)
      player1
    elsif self.type == :basic && self.player2.deck.rank_of_card_at(0) > self.player1.deck.rank_of_card_at(0) ||
    self.type == :war && self.player2.deck.rank_of_card_at(2) > self.player1.deck.rank_of_card_at(2)
      player2
    elsif self.type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << self.player1.deck.cards.shift
      @spoils_of_war << self.player2.deck.cards.shift
    elsif self.type == :war
      @spoils_of_war << self.player1.deck.cards.shift(3)
      @spoils_of_war << self.player2.deck.cards.shift(3)
    elsif self.type == :mutually_assured_destruction
      self.player1.deck.cards.shift(3)
      self.player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war.shift(3)
    winner.deck.cards.flatten!
    # flatten_card_array
  end

  # def flatten_card_array
  #   winner.deck.cards.flatten!
  # end

end
