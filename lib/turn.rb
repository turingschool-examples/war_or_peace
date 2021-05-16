class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2, spoils_of_war)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck1.rank_of_card_at(0) != @player2.deck2.rank_of_card_at(0)
      return :basic

    elsif @player1.deck1.rank_of_card_at(0) == @player2.deck2.rank_of_card_at(0)
      return :war

    else @player1.deck1.rank_of_card_at(0) == @player2.deck2.rank_of_card_at(0) && @player1.deck1.rank_of_card_at(2) == @player2.deck2.rank_of_card_at(2)
      return :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      return [@player1.deck1.rank_of_card_at(0) == @player2.deck2.rank_of_card_at(0)].max
    elsif type == :war
      return [@player1.deck1.rank_of_card_at(2) == @player2.deck2.rank_of_card_at(2)].max
    else type == :mutually_assured_destruction
      return 'no winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck1.shift
      @spoils_of_war << @player2.deck2.shift
    elsif type == :basic
      @spoils_of_war << @player1.deck1.shift
      @spoils_of_war << @player2.deck2.shift
    else type == :basic
      @spoils_of_war << @player1.deck1.remove_card
      @spoils_of_war << @player2.deck2.remove_card
    end
  end

  def award_spoils
    winner << @spoils_of_war
  end
end
