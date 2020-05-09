class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
    @exile = []
    @players = [p1, p2]
  end

  def type
    if same_first_rank? && same_third_rank?
      :mutually_assured_destruction
    elsif same_first_rank?
      :war
    else
      :basic
    end
  end

  def same_first_rank?
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end

  def same_third_rank?
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  end

  def winner
    win_hash = {  basic: basic_winner,
                  war: war_winner,
                  mutually_assured_destruction: "No Winner"
                }
    win_hash[type]
  end

  def basic_winner
    @players.max_by do |player|
      player.deck.rank_of_card_at(0)
    end
  end

  def war_winner
    @players.max_by do |player|
      player.deck.rank_of_card_at(2)
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      mad_exile
    elsif type == :war
      war_pile
    elsif type == :basic
      basic_pile
    end
  end

  def basic_pile
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
    @spoils_of_war.shuffle!
  end

  def war_pile
    3.times { @spoils_of_war << @player1.deck.remove_card }
    3.times { @spoils_of_war << @player2.deck.remove_card }
    @spoils_of_war.shuffle!
  end

  def mad_exile
    3.times { @exile << @player1.deck.remove_card }
    3.times { @exile << @player2.deck.remove_card }
  end



end
