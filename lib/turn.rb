class Turn
  attr_reader :player1,
              :player2,
              :winner,
              :pile_cards,
              :spoils_of_war


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

  def pile_cards
    players = [@player1.deck.cards[0], @player2.deck.cards[0]]
      players.each do |player|
          @spoils_of_war << player
        end
  end
end
