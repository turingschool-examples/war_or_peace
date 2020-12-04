class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
    @type_class    = {[false, false] => :basic,
                      [false, true] => :basic,
                      [true, false] => :war,
                      [true, true] => :mutually_assured_distruction}
  end

  def compaire(index) #########
    player1.deck.rank_of_card_at(index) ==
    player2.deck.rank_of_card_at(index)
  end

  def type
      @type_of_turn = @type_class[[compaire(0), compaire(2)]]
  end

  def winner
    condition = {:basic => 0, :war => 2}
    if condition[@type_of_turn] == nil
      "No Winner"
    elsif player1.deck.rank_of_card_at(condition[@type_of_turn]) >
          player2.deck.rank_of_card_at(condition[@type_of_turn])
      @winner = @player1
    else
      @winner = @player2
    end
  end

  def pile_cards
    if @type_of_turn == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif @type_of_turn == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils
    @spoils_of_war.each do |card|
      @winner.deck.cards << card
    end
    @spoils_of_war = []
  end

end
