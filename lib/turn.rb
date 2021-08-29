class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :deck


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
    if (player1.deck.rank_of_card_at(0).to_i == player2.deck.rank_of_card_at(0).to_i) && (player1.deck.rank_of_card_at(2).to_i == player2.deck.rank_of_card_at(2).to_i)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0).to_i == player2.deck.rank_of_card_at(0).to_i
      :war
    else
      :basic
    end
  end

  def winner
    case self.type
    when :mutually_assured_destruction
      "No Winner"
    when :war
      if player1.deck.rank_of_card_at(2).to_i > player2.deck.rank_of_card_at(2).to_i
        player1
      elsif player2.deck.rank_of_card_at(2).to_i > player1.deck.rank_of_card_at(2).to_i
        player2
      end
    when :basic
      if player1.deck.rank_of_card_at(0).to_i > player2.deck.rank_of_card_at(0).to_i
        player1
      elsif player2.deck.rank_of_card_at(0).to_i > player1.deck.rank_of_card_at(0).to_i
        player2
      end
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      3.times do
        spoils_of_war << player1.deck.cards.shift
        spoils_of_war << player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      if player1.deck.cards.count >= 3 && player2.deck.cards.count >= 3
        3.times do
          player1.deck.cards.shift
          player2.deck.cards.shift
        end
      elsif player1.deck.cards.count < 3
        player1.deck.cards.clear
      elsif player2.deck.cards.count < 3
        player2.deck.cards.clear
      end
    end
  end

  def award_spoils(winner)
    if winner == player1
       (player1.deck.cards << spoils_of_war).flatten!
       spoils_of_war.clear
    elsif winner == player2
      (player2.deck.cards << spoils_of_war).flatten!
      spoils_of_war.clear
    end
  end

  def start(player1, player2)
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
  The players today are #{player1.name} and #{player2.name}.
  Type 'GO' to start the game!"
  end
end
