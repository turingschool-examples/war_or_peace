class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2, spoils_of_war = [])
    @player1 = player1
    @player2 = player2
    @spoils_of_war = spoils_of_war
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      turn_type = :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      turn_type = :war
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    turn_type = :mutually_assured_destruction
    # else
    #   turn_type = :basic
    end
    turn_type
  end

  def winner(winner = "")
    if type == :mutually_assured_destruction
      # binding.pry
       "No Winner"
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @player2
      end
    elsif type == :basic
     if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
       @player1
     elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
       @player2
     end
    end

  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif type == :war
      3.times do
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end
    elsif type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    end
  end

  def award_spoils
    if type == :basic || type == :war
      spoils_of_war.each do |spoil|
        winner.deck.cards << spoil
      end
      # winner.deck.cards.flatten!
    end
    spoils_of_war.clear
  end

end
