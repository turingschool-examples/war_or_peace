class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def should_we_play?
    player1.deck.cards.length >= 3 && player2.deck.cards.length >=3
  end

  def type
    if should_we_play?
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        # puts "PLEASE"
        :mutually_assured_destruction
      elsif player1.deck.rank_of_card_at(0) !=  player2.deck.rank_of_card_at(0)
        :basic
        # puts "#{player1.deck.rank_of_card_at(0)}"
      else
        :war
        # puts "WORK"
      end
    end
  end

  def winner
    # require 'pry'; binding.pry
    if type == :basic
      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war
      if should_we_play?
        player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
      end
    else
      'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]

      player1.deck.remove_card
      player2.deck.remove_card
    elsif type == :war
      @spoils_of_war.push(player1.deck.cards.shift(3)).flatten!
      @spoils_of_war.push(player2.deck.cards.shift(3)).flatten!
    elsif type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
     if type == :mutually_assured_destruction
       return
     end
     winner.deck.cards.push(@spoils_of_war).flatten!
     @spoils_of_war.clear
   end
end
