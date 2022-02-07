class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      return 'basic'
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      return 'mutually_assured_destruction'
    else
      return 'war'
    end
  end



  def winner
    if type == 'basic'
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        return @player1
      else
        return @player2
      end
    elsif type == 'war'
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        return @player1
      else
        return @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards
    if type == 'basic'
      @spoils_of_war.push(@player1.deck.cards[0])
      @spoils_of_war.push(@player2.deck.cards[0])
      @player1.deck.cards.shift
      @player2.deck.cards.shift
    elsif type == 'war'
      @spoils_of_war.push(@player1.deck.cards[0..2])
      @spoils_of_war.push(@player2.deck.cards[0..2])
      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)
    elsif type == 'mutually_assured_destruction'
      @player1.deck.cards.slice!(0..2)
      @player2.deck.cards.slice!(0..2)
    end
  end

  def award_spoils(winner)
    winner.deck.cards.push(spoils_of_war)
    @spoils_of_war = []

  end

end
