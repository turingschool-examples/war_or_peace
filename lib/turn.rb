class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :winner,
              :pile_cards


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    :basic
  end

  def winner
    @player1
  end

  def spoils_of_war
  players = [@player1, @player2]
    players.each do |player|
      @spoils_of_war << player.deck.cards[0]
    end

  end


end
