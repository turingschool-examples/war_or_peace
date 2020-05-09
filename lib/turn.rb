class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :players

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
    @exile = []
    @players = [p1, p2]
    @counter = 0
    @limit = 10**6
    @winner = nil
    @turn_winner = nil
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
    @players.each do |player|
      player.nil_check(0)
    end
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end

  def same_third_rank?
    @players.each do |player|
      player.nil_check(2)
    end
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  end

  # a really weird getter/setter method
  def winner
    win_hash = {  basic: basic_winner,
                  war: war_winner,
                  mutually_assured_destruction: "No Winner"
                }
    win_hash[type]
  end

  def player_lost?
    @players.any? do |player|
      player.has_lost?
    end
  end

  def loser
    @players.select do |player|
      player.has_lost?
    end
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
      if @turn_winner == nil
        "It's a tie."
      else
        "*mutually assured destruction* 6 cards removed from play"
      end
    elsif type == :war
      war_pile
      if @turn_winner == nil
        "It's a tie."
      else
        "WAR - #{@turn_winner.name} won #{@spoils_of_war.size} cards"
      end
    elsif type == :basic
      basic_pile
      if @turn_winner == nil
        "It's a tie."
      else
        "#{@turn_winner.name} won #{@spoils_of_war.size} cards"
      end
    end
  end

  def basic_pile
    @players.each do |player|
      break if player.has_lost?
      @spoils_of_war << player.deck.remove_card
    end
  end

  def war_pile
    3.times { basic_pile }
  end

  def mad_exile
    3.times do
      @players.each do |player, i|
        break if player.has_lost?
        @exile << player.deck.remove_card
      end
    end
  end

  def award_spoils(turn_winner)
    unless @spoils_of_war.empty?
      @spoils_of_war.shuffle!
      @spoils_of_war.each do |spoil|
        turn_winner.hand << spoil
      end
      @spoils_of_war = []
    end
  end

 # for runner file

  def count
    @counter += 1
  end


  def game_over?
    @counter == @limit || player_lost?
  end

  def start
  until game_over? do
    @turn_winner = winner
    p "Turn #{count}: #{pile_cards}"
    award_spoils(@turn_winner) unless @turn_winner == "No Winner"
      if game_over?
        p "GG #{@turn_winner.name}"
        break
      end
    end
  end

end
