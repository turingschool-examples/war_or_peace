class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = type
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
    end
  end

  def winner
    if @type == :basic && player_card_rank_at_0
    end
  end

  def pile_cards
    if :basic
      @spoils_of_war.flatten << [@player1.deck[0],@player2.deck[0]]
    elsif :war
      @spoils_of_war.flatten << [@player1.deck[0..2],@player2.deck[0..2]]
    end
  end

  def player_card_rank_at_0
    rank_array_0 = [@player1.deck.rank_of_card_at(0),@player2.deck.rank_of_card_at(0)].max
  end

  # def player_card_rank_at_2
  #   rank_array_2 = [@player1.deck.rank_of_card_at(2),@player2.deck.rank_of_card_at(2)].max
  # end

end






end
