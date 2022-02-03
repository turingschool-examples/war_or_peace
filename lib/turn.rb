class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2, spoils_of_war = [])
    @player1 = player1
    @player2 = player2
    @spoils_of_war = spoils_of_war
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      turn_type = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      turn_type = :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    turn_type = :basic
    else
      turn_type = :invalid
    end
    turn_type
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        winning_player = @player1
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        winning_player = @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        winning_player = @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        winning_player = @player2
      end
    elsif type == :mutually_assured_destruction
      winning_player = "No Winner"
    else
      winning_player = "Invalid"
    end
    winning_player
  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif type == :war
      spoils_of_war << player1.deck.cards[0]
      spoils_of_war << player2.deck.cards[0]
      spoils_of_war << player1.deck.cards[2]
      spoils_of_war << player2.deck.cards[2]
    elsif type == :basic
      spoils_of_war << player1.deck.cards[0]
      spoils_of_war << player2.deck.cards[0]
    end
  end

  def award_spoils
      spoils_of_war.each do |spoil|
        winner.deck.cards << spoil
      end
      @spoils_of_war = []
  end

end
