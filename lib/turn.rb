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

  # a really weird getter method
  def winner
    win_hash = {  basic: basic_winner,
                  war: war_winner,
                  mutually_assured_destruction: "No Winner"
                }
    win_hash[type]
  end

  def basic_winner
    @players.max_by do |player|
      player.deck.rank_of_card_at(0) unless player.zero_check(0)
    end
  end

  def war_winner
    @players.max_by do |player|
      player.deck.rank_of_card_at(2) unless player.zero_check(2)
    end
  end

  def winner_name
    if winner.class == Player
      winner.name
    else
      "*mutually assured destruction*"
    end
  end

  def pile_cards
    turn_winner = winner_name
    if type == :mutually_assured_destruction
      mad_exile
      "#{turn_winner} 6 cards removed from play"
    elsif type == :war
      war_pile
      "WAR - #{turn_winner} won #{@spoils_of_war.size} cards"
    elsif type == :basic
      basic_pile
      "#{turn_winner} won #{@spoils_of_war.size} cards"
    end
  end

  def player_short?
    @players.any? { |player| player.short_hand? }
  end

  def player_lost?
    @players.any? { |player| player.has_lost? }
  end

  def get_loser
    @players.select { |player| player.has_lost? }
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

  def last_turn?
    # is this a closure?

    def three_cards?
      type == :mutually_assured_destruction || type == :war
    end

    def one_card?
      type == :basic
    end

    last_turn = false

    if ( three_cards? || one_card? ) && player_short?
      last_turn = true
    end

    last_turn

  end


 # for runner file

  def count
    @counter += 1
  end

  def game_over?
    @counter == @limit || last_turn?
  end


  def start
  until game_over? do
    turn_winner = winner
    p "Turn #{count}: #{pile_cards}"
    award_spoils(turn_winner) unless turn_winner == "No Winner"
      if game_over?
        p "GG #{winner_name} on Turn #{@counter}"
        break
      end
    end
  end

end
