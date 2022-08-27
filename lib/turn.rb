class Turn
  attr_reader :player1, :player2, :spoils_of_war, :loser, :turn_winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_winner = nil
    @loser = loser
  end
  
  def fewer_than_3_cards?
    if player1.deck.cards.count < 3 || player2.deck.cards.count < 3
      true 
    else
      false
    end
  end
  
  def type
    if player1.deck.cards[0].rank == player2.deck.cards[0].rank && fewer_than_3_cards?
      return :sudden_death
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      return :mutually_assured_destruction
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank
      return :war
    else
      return :basic
    end
  end
  
  def winner
    if type == :sudden_death
      if player1.deck.cards.count < 3
        @loser = @player1
        @turn_winner = @player2
      else
        @loser = player2
        @turn_winner = @player1
      end
    elsif type == :basic
      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        @turn_winner = @player1
      else
        @turn_winner = @player2
      end
    elsif type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        @turn_winner = @player1
      else
        @turn_winner = @player2
      end
    elsif type == :mutually_assured_destruction
      return "No Winner"
    end
  end
  
  def pile_cards
    if type == :sudden_death
      minimum_number_of_cards = [player1.deck.cards.count, player2.deck.cards.count].min
      @spoils_of_war << @player1.deck.cards.shift(minimum_number_of_cards)
      @spoils_of_war << @player2.deck.cards.shift(minimum_number_of_cards)
    elsif type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      3.times do
        @player1.deck.cards.shift
        @player2.deck.cards.shift
      end
    end
  end
  
  def award_spoils(winner)
    @spoils_of_war.count.times do |element|
      @turn_winner.deck.cards << @spoils_of_war[element]
    end
    @spoils_of_war.clear
  end
end

























