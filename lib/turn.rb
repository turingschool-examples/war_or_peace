class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

    @type = determine_type
  end

  def determine_type
    return :basic unless player1.deck.cards[0].rank == player2.deck.cards[0].rank

    return :loss if player1.deck.cards.length < 3 || player2.deck.cards.length < 3

    return :war unless player1.deck.cards[2].rank == player2.deck.cards[2].rank

    :mutually_assured_destruction
  end

  def winner
    case type
    when :basic
      return player1 unless player1.deck.cards[0].rank < player2.deck.cards[0].rank

      player2
    when :war
      return player1 unless player1.deck.cards[2].rank < player2.deck.cards[2].rank

      player2
    when :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards
    case type
    when :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    when :war
      3.times do
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end
    when :mutually_assured_destruction
      3.times do
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    
      spoils_of_war.each { |card| winner.deck.add_card(card) } unless type == :mutually_assured_destruction
    
    
    
  end
end
