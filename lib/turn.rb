class Turn

  attr_reader :player_1, :player_2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def player1
    @player1.deck.cards[0]
  end

  def player2
    @player2.deck.cards[0]
  end

  def type
    if (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) && (@player1.deck.cards[2].rank == @player2.deck.cards[2].rank)
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    else
      :basic
    end
  end

  def winner
    if type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @winner = @player1
      elsif @player2.deck.cards[0].rank > @player1.deck.cards[0].rank
        @player2
      end
    elsif type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      elsif @player2.deck.cards[2].rank > @player1.deck.cards[2].rank
        @player2
      end
    elsif type == :mutually_assured_destruction
      puts "No Winner."
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.push(@player1.deck.cards[0])
      @spoils_of_war.push(@player2.deck.cards[0])
      @player1.deck.remove_card
      @player2.deck.remove_card

    elsif type == :war
      @spoils_of_war.push(@player1.deck.cards[0..1])
      @spoils_of_war.push(@player2.deck.cards[0..1])
        3.times do
          @player1.deck.remove_card
          @player2.deck.remove_card
        end

    elsif type == :mutually_assured_destruction
      @player1.deck.cards.delete(@player1.deck.cards[0..1])
      @player2.deck.cards.delete(@player2.deck.cards[0..1])
    end
  end

  def award_spoils(winner)
    if @winner == @player1
      @player1.deck.cards.push(@spoils_of_war).flatten!
    elsif @winner == @player2
      @player2.deck.cards.push(@spoils_of_war).flatten!
    end
  end

end
