class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
    player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
  end

  def winner
    type == :basic
      @winner = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2

  end

  def pile_cards
    type == :basic
      pile_basic
  end

  def pile_basic
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
  end

  def award_spoils
    @spoils_of_war.each {|spoils| @winner.deck.add_card(spoils)}
  end

end
