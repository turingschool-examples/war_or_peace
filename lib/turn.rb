class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      then ":basic"
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      then ":war"
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      then ":mutually_assured_destruction"
    end
  end

  def winner
    if @type == ":basic"
    elsif @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      then player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      then player2
    elsif @type == ":war" then
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        then player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        then player2
    elsif @type == ":mutually_assured_destruction"
      then puts "No winner"
      end
    end
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
