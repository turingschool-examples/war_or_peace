class Turn
  attr_reader :player1, :player2, :spoils_of_war, :input

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @input = nil
  end

  def type
    if player1.deck.cards.count < 3 && player2.deck.cards.count < 3
      :draw
    elsif player1.deck.cards.count < 3 && player2.deck.cards.count >= 3
      :player1_loses
    elsif player2.deck.cards.count < 3 && player1.deck.cards.count >= 3
      :player2_loses
    else
      if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      else
        :basic
      end
    end
  end

  def winner
    if player1.has_lost?
      player2
    elsif player2.has_lost?
      player1
    elsif type == :basic
      if @player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards[0]
      player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0..2]
      player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards[0..2]
      player2.deck.cards.shift(3)
      @spoils_of_war.flatten!
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
      end
      3.times do
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    if winner == player1
      player1.deck.cards << @spoils_of_war
      player1.deck.cards.flatten!
    elsif winner == player2
      player2.deck.cards << @spoils_of_war
      player2.deck.cards.flatten!
    end

    @spoils_of_war.clear
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"

    @input = gets.chomp
  end
end

#
# def type
#   if @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3
#     if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
#       :basic
#     elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
#       :war
#     else
#       :mutually_assured_destruction
#     end
#   elsif @player1.deck.cards.count == 2 || @player2.deck.cards.count == 2
#     if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
#       :basic
#     elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(1) != @player2.deck.rank_of_card_at(1)
#       :war
#     else
#       :mutually_assured_destruction
#     end
#   elsif @player1.deck.cards.count == 1 || @player2.deck.cards.count == 1
#     if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
#       player2.has_lost? == true
#     elsif @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
#       player1.has_lost? == true
#     else
#       if @player1.deck.cards.count > @player2.deck.cards.count
#         player2.has_lost? == true
#       if @player2.deck.cards.count > @player1.deck.cards.count
#         player1.has_lost? == true
#       end
#     end
#   end
# end
