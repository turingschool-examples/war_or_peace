class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  # why would turn.type block this from working???
  def winner
    if type == :mutually_assured_destruction
      p 'no winner'

    elsif type == :war
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @player1
      elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        @player2
    elsif type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        @player2
      end
    end
  end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
      @spoils_of_war
    elsif type == :war
      3.times do
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      end
      @spoils_of_war

   elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end

       @spoils_of_war
    end
  end

  #this method will add each of the cards in spoils of war to the winner of the turn
  def award_spoils(winner)
    @spoils_of_war.each do |spoil_of_war|
      winner.deck.add_card(spoil_of_war)
    end
      #winner.deck.cards.concat(@spoils_of_war)
  end
end
