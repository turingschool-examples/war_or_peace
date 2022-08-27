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
      #how the game is played. must have a winner or war! if two war than spoils of war! rank_of_cards_at
      #get discarded with no winner.
    if @player1.deck.rank_of_cards_at(0) != @player2.deck.rank_of_cards_at(0)
      :basic
    end
  end
end
