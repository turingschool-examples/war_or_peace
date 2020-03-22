class Turn
  attr_reader :spoils_of_war, :player1, :player2
  def initialize(player1, player2, spoils_of_war = [])
    @player1 = player1
    @player2 = player2
    @spoils_of_war = spoils_of_war
  end

  def type

    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      type = :basic

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      type = :war

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        winner = player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        winner = player2
      end

    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        winner = player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        winner = player2
      end

    elsif type == :mutually_assured_destruction
      winner =  "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    elsif type == :war
      3.times do
        if player1.has_lost == true
          break
        else
          spoils_of_war << player1.deck.remove_card
        end
      end
      3.times do
        if player2.has_lost == true
          break
        else
          spoils_of_war << player2.deck.remove_card
        end
      end
    elsif type == :mutually_assured_destruction
      3.times do
        if player1.has_lost == true || player2.has_lost == true
          break
        else
          player1.deck.remove_card
          player2.deck.remove_card
        end
      end
    end
  end

  def award_spoils(winner)
    turn_winner = winner
    pile_cards
    if type == :basic || type == :war
      spoils_of_war.each do|card|
        turn_winner.deck.add_card(card)
      end
    end
  end

  def start
    turn_counter = 1
    maximum_turns == 1000000
    while player1.has_lost == false && player2.has_lost == false
      if turn_counter <= maximum_turns
        if type == :basic
          p "Turn #{turn_counter}: #{winner} won 2 cards"
          award_spoils
          turn_counter += 1
        elsif type == :war
          p "Turn #{turn_counter}: WAR - #{winner} won 6 cards."
          award_spoils
          turn_counter += 1
        elsif type = mutually_assured_destruction
          p "Turn #{turn_counter}: *mutually_assured_destruction* 6 cards removed from play"
          pile_cards
          turn_counter += 1
        end
      else
        p "--- DRAW ---"
        break
      end
    end
  end
end
