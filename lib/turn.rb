
class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_cards_at(0) != player2.deck.rank_of_cards_at(0)
      :basic
    elsif player1.deck.rank_of_cards_at(0) == player2.deck.rank_of_cards_at(0) && player1.deck.rank_of_cards_at(2) == player2.deck.rank_of_cards_at(2)

      :mutually_assured_destruction

    elsif player1.deck.rank_of_cards_at(0) == player2.deck.rank_of_cards_at(0)
      :war

    else
      "404: Correct coding not found"
    end
  end

  def winner(type_of_turn)
    if type_of_turn == :basic
      if player1.deck.rank_of_cards_at(0) > player2.deck.rank_of_cards_at(0)
        "player1"
      else
        "player2"
      end

    elsif type_of_turn == :war
      if player1.deck.rank_of_cards_at(2) > player2.deck.rank_of_cards_at(2)
        "player1"
      else
        "player2"
      end

    elsif type_of_turn == :mutually_assured_destruction
      "No Winner"

    else
      "404: Correct coding not found"
    end
  end

  def pile_cards(type_of_turn)
    if type_of_turn == :basic
      @spoils_of_war.push(player1.deck.cards[0])
      @spoils_of_war.push(player2.deck.cards[0])
      @spoils_of_war
      player1.deck.remove_card
      player2.deck.remove_card

    elsif type_of_turn == :war
      @spoils_of_war.push(player1.deck.cards[0])
      @spoils_of_war.push(player1.deck.cards[1])
      @spoils_of_war.push(player1.deck.cards[2])
      @spoils_of_war.push(player2.deck.cards[0])
      @spoils_of_war.push(player2.deck.cards[1])
      @spoils_of_war.push(player2.deck.cards[2])
      @spoils_of_war

      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif type_of_turn == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    else
      "404: Correct coding not found"
    end
  end

  def award_spoils(winner)
    if winner == "player1"
      @spoils_of_war.each do |i|
        player1.deck.add_card(i)
      end
      return @spoils_of_war
      @spoils_of_war = []
      #player1.deck.cards
    elsif winner == "player2"


      @spoils_of_war.each do |n|
        player2.deck.add_card(n)
      end
      return @spoils_of_war
      @spoils_of_war = []
      #player2.deck.cards
    elsif winner == "player1"
      player1.deck.add_card(@spoils_of_war)
      @spoils_of_war = []
    elsif winner == "player2"
      player2.deck.add_card(@spoils_of_war)
      @spoils_of_war = []
    elsif winner(:mutually_assured_destruction) == "No Winner"
      @spoils_of_war = []
    else
      "404: Correct coding not found"
    end
  end
  def spoils_of_war
    @spoils_of_war
  end
end
