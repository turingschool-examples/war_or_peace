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
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
        player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        return :mutually_assured_destruction
      else
        return :war
      end
    else
      return :basic
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif type == :mutually_assured_destruction
      return "No winner this time."
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :mutually_assured_destruction
      player1.deck.remove_card
      player1.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
    end
  end

  def award_spoils(victor)
    if winner == player1
      player1.deck.add_card(pile_cards).flatten
    else
      player2.deck.add_card(pile_cards).flatten
    end
  end

  def start

  count = 0
    loop do
      count += 1

      pile_cards

      winner

      award_spoils(winner)

      if type == :mutually_assured_destruction
        puts "Turn #{count}: *Mutually Assured Destruction* 6 cards removed from play"
      elsif type == :war
        puts "Turn #{count}: WAR - #{winner.name} won 6 cards"
      else
        puts "Turn #{count}: #{winner.name} won 2 cards"
      end

      if player1.has_lost? == true
        puts "*~*~*~*#{player2.name} has won the game! *~*~*~*"
        break
      elsif player2.has_lost? == true
        puts "*~*~*~*#{player1.name} has won the game! *~*~*~*"
        break
      elsif count == 100
        puts "Draw!"
        break
      end
    end
  end
end
