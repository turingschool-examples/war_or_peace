class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  # def type
  #   if rank_of_card_at(0)
  #     players.decks != .rank
  #     :basic
  #   elsif rank_of_card_at(0)
  #     players.decks == players.decks
  #     :war
  #   else rank_of_card_at(0)
  #     rank_of_card_at(2)
  #
  # end
end
