class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type

      p1card = @player1.deck.rank_of_card_at(0)
      p2card = @player2.deck.rank_of_card_at(0)
      p1card3 = @player1.deck.rank_of_card_at(2)
      p2card3 = @player2.deck.rank_of_card_at(2)

      if p1card != p2card
          :basic
      elsif p1card == p2card || p1card3 == p2card3
        :mutually_assured_destruction
      elsif p1card == p2card
        :war
      else
        puts "Game Over"
      end
  end

  def winner

    p1card = @player1.deck.rank_of_card_at(0)
    p2card = @player2.deck.rank_of_card_at(0)

    if type == :basic
      if p1card > p2card
        @player1
      else
        @player2
      end
    elsif type == :war
        if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
          @player1
        else
          @player2
        end
    elsif type == :mutually_assured_destruction
        puts "No Winner"
    else
      puts "Game Over"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}
    elsif type == :mutually_assured_destruction
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
    else
      puts "Game Over"
    end

  end

  def award_spoils(winner)
    @spoils_of_war.map do |card|
      winner.deck.cards << card
    end
  end



end
