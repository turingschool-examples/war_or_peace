class Turn
  attr_reader :player1, # allows for reading player1, player2, and spoils_of_war instance variables
              :player2,
              :spoils_of_war

  def initialize(player1, player2) # creates player1 and player2 variables based off player information
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type  # determines what type of turn the game is
    # this if/else branch prevents an error on war turns if either player's deck has less than three cards
    if player1.deck.cards.count <= 3 && player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      until player1.deck.cards.count == 0
        player1.deck.remove_card
      end
      player1.deck.cards << Card.new(:badace, "Bad Ace", 1)
    elsif player2.deck.cards.count <= 3 && player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      until player2.deck.cards.count == 0
        player2.deck.remove_card
      end
      player2.deck.cards << Card.new(:badace, "Bad Ace", 1)
    end
    # this branch actually determines the type of turn
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      @turn = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @turn = :war
    else
      @turn = :basic
    end
  end

  def winner # determines winner of the turn
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

  def pile_cards # removes cards from player decks, and adds them to spoils of war if relevant to type of turn
    type
    if @turn == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif @turn == :war
        3.times do
          @spoils_of_war << player1.deck.remove_card
          @spoils_of_war << player2.deck.remove_card
        end
    elsif @turn == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    else
    end
  end

  def award_spoils(winner) # piles cards, then awards the spoils of war to the winning player if either player won
    pile_cards
    if winner == player1 || winner == player2
      while @spoils_of_war != []
        winner.deck.add_card(@spoils_of_war[0])
        @spoils_of_war.shift
      end
    else
    end
  end

  def start # where all of the game logic comes into play
    turn_count = 0 # turn counter; starts at 0 and increments every turn

      #continues looping until either player has lost or 1,000,000 turns have passed
    until player1.has_lost? == true || player2.has_lost? == true || turn_count == 1000000
      turn_count += 1
      type
      if @turn == :basic
        p "Turn #{turn_count}: #{winner.name} won 2 cards"
      elsif @turn == :war
        p "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
      else @turn == :mutually_assured_destruction
        p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
      end
      award_spoils(winner)
      turn = Turn.new(player1, player2) # starts a new turn with the adjusted decks from award_spoils
    end

      # displays the winner of the game, or a draw if neither player won
    if player1.has_lost? == true && player2.has_lost? == true
      p "Draw"
    elsif player2.has_lost? == true
      p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    elsif player1.has_lost? == true
      p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    else
      p "Draw"
    end

#    return true # for testing
  end
end
