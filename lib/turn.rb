
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
        :mutually_assured_destruction
      else
        :war
      end
    else
     :basic
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
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    pile_cards
    while spoils_of_war != [] do
      winner.deck.cards << spoils_of_war.shift
    end
  end

  def start
  count = 0
    loop do
      count += 1
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
      elsif count == 100000
        puts "Draw!"
        break
      end
    end
  end
end
