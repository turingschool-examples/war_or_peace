class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif (player1.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.rank_of_card_at(2) != player2.deck.rank_of_card_at(2))
      return :war
    else (player1.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      return :mutually_assured_destruction
    end

  end

  def winner
    #if self.type == :basic, then highest rank_of_card_at(0), return that player object
    #elseif self.type == :war, then highest rank_of_card_at(2), return that player object
    #else self.type == :mutually_assured_destruction, return "No Winner"
  end

  def pile_cards
    #depending on the type of war, cards are moved into spoils of war array
    #if self.type == :basic, @spoils_of_war.push(player1.remove_card, player2.remove_card)
    #if self.type == :war, @spoils_of_war.push()
  end

  def award_spoils(winner)
    #push the entire contents of the array into the winners deck- winner.deck.push(@spoils_of_war)
    #array should be empty after push

  end


end
