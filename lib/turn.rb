class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if @type == :basic
    elsif @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      player2
    elsif @type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        player2
    elsif @type == :mutually_assured_destruction
      puts "No winner"
      end
    end
  end

  def pile_cards(spoils)
    @spoils_of_war << spoils
    if @type == :basic
      spoils << @player1.deck(0)
      spoils << @player2.deck(0)
    elsif @type == :war
      spoils << deck(0, 1, 2)
    elsif @type == :mutually_assured_destruction
      @deck.delete_at(0, 1, 2)
    end
  end

  def award_spoils
    rghtfgjhdn << spoils_of_war
  end

end

  #
  #   if @type == ":mutually_assured_destruction"
  #     then puts "No Winner"
  #   end
  # end



    #end





# @spoils_of_war = spoils_of_war
#
# def spoils_of_war(spoils_of_war)
#   @spoils_of_war
# end
#
# def player1(name, deck1)
# end
#
# def player2(name, deck2)
# end
