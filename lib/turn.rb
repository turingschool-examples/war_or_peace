class Turn
  attr_reader :player1,
              :player2,
              :players,
              :spoils_of_war

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @players = [p1, p2]
    @spoils_of_war = []
  end

  def type
    if first_same? && third_same?
      :mutually_assured_destruction
    elsif first_same?
      :war
    else
      :basic
    end
  end

  def first_same?
    @player1.deck.first_card == @player2.deck.first_card
  end

  def third_same?
    @player1.deck.third_card == @player2.deck.third_card
  end

  def winner
    winner =  { mutually_assured_destruction: "No Winner",
                war: war_winner,
                basic: basic_winner }
    winner[type] # returns a string or obj
  end

  def war_winner
    sorted = @players.sort_by do |player|
      player.deck.third_card
    end
    winner = sorted[-1]
    winner
  end

  def basic_winner
    sorted = @players.sort_by do |player|
      player.deck.first_card
    end
    winner = sorted[-1]
    winner
  end

  def pile_cards
    if type == :mutually_assured_destruction
      mad_pile
    elsif type == :war
      war_pile
    elsif type == :basic
      basic_pile
    end
  end

  def mad_pile
    @players.each do |player|
      3.times { player.deck.remove_card }
    end
  end

  def war_pile
    @players.each do |player|
      3.times { @spoils_of_war << player.deck.remove_card }
    end
  end

  def basic_pile
    @players.each do |player|
      @spoils_of_war << player.deck.remove_card
    end
  end

  def award_spoils(winner)
    until @spoils_of_war.empty?
      if winner.class == String
        break
      else
      winner.deck.add_card(@spoils_of_war.shift)
      end
    end
  end

end
