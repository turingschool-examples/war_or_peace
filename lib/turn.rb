class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = determine_winner
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    end
  end

  def high_card_0
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    else
      player2
    end
  end

  def high_card_2
    if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      player1
    else
      player2
    end
  end

  def determine_winner
    if type == :mutually_assured_destruction
      return "No Winner"
    elsif type == :war
      high_card_2
    elsif type == :basic
      high_card_0
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
    elsif type == :war
      3.times { @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card) }
    elsif type == :mutually_assured_destruction
        3.times { player1.deck.remove_card && player2.deck.remove_card }
      false
    end
  end

  def award_spoils
    @spoils_of_war.each do |card|
      determine_winner.deck.cards << card
    end
    @spoils_of_war.clear
  end

  def start_game
    @turn_num = 0
    if type == :mutually_assured_destruction
      @turn_num += 1
      pile_cards
      puts "Turn #{@turn_num}: *mutually assured destruction* 6 cards removed from play"
    elsif type == :basic
      @turn_num += 1
      pile_cards
      award_spoils
      puts "Turn #{@turn_num}: #{determine_winner.name} won 2 cards"
    elsif type == :war
      @turn_num += 1
      pile_cards
      award_spoils
      puts "Turn #{@turn_num}: WAR - #{determine_winner.name} won 6 cards"
    end
  end

end
