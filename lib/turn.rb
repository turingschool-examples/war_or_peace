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
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @turn = :basic
    elsif player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      @turn = :war
    else
      @turn = :mutually_assured_destruction
    end
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player1
    elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      return player2
    elsif player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player1
    elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      return player2
    else
      return "No Winner"
    end
  end

  def pile_cards
    type
    if @turn == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
      player1.deck.remove_card
      player2.deck.remove_card
    elsif @turn == :war
        @spoils_of_war << player1.deck.cards[0]
        @spoils_of_war << player1.deck.cards[1]
        @spoils_of_war << player1.deck.cards[2]
        @spoils_of_war << player2.deck.cards[0]
        @spoils_of_war << player2.deck.cards[1]
        @spoils_of_war << player2.deck.cards[2]
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif @turn == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    else
    end
  end

  def award_spoils
    if winner == player1
      pile_cards
      while @spoils_of_war != []
        player1.deck.add_card(@spoils_of_war[0])
        @spoils_of_war.shift
      end
    elsif winner == player2
      pile_cards
      while @spoils_of_war != []
        player2.deck.add_card(@spoils_of_war[0])
        @spoils_of_war.shift
      end
    else
      pile_cards
    end
  end

  def start
    turn_count = 0

    until player1.has_lost? == true || player2.has_lost? == true || turn_count == 1000000
      turn_count += 1
      type
      if @turn == :basic
        p "Turn #{turn_count}: #{winner.name} won 2 cards"
      elsif @turn == :war
        p "Turn #{turn_count}: #{winner.name} won 6 cards"
      else @turn == :mutually_assured_destruction
        p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
      end
      award_spoils
    end

    if player2.has_lost? == true
      p "#{player1.name} has won the game!"
    elsif player1.has_lost? == true
      p "#{player2.name} has won the game!"
    else
      p "Draw"
    end
    game_end = true
    return game_end
  end
end
