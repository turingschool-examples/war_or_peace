class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = :basic
  end

  def winner
    if player1.deck.remove_card.rank > player2.deck.remove_card.rank
      player1
    end
  end

  def players_names
    [player1.name, player2.name]
  end



end
