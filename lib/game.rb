class Game
  attr_accessor :turn, :turn_type, :hand_winner, :create_full_deck

  def initialize(turn)
    @turn = turn
    @turn_type = @turn.type
    @hand_winner = @turn.winner
    @create_full_deck = []
  end

  def start(player1, player2)
    p ''
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    p "The players today are #{player1.name} and #{player2.name}."
    p "Press 'RETURN' to start the game"
    p '------------------------------------------------------------------'
    gets
    p ''
    p 'here we go!'
    p ''
    p ''
  end

  def game_over?
    @turn.player1.has_lost? || @turn.player2.has_lost?
  end

  # def endgame?
  #   turn.player1.deck.cards.length < 3 || turn.player2.deck.cards.length < 3
  # end

  # def three_card_endgame?
  #   turn.player1.deck.cards.length == 3 || turn.player2.deck.cards.length == 3
  # end

  def two_card_endgame?
    turn.player1.deck.cards.length == 2 || turn.player2.deck.cards.length == 2
  end

  def one_card_endgame?
    turn.player1.deck.cards.length == 1 || turn.player2.deck.cards.length == 1
  end

  def one_card_endgame
    if turn.player1.deck.cards[0].rank < turn.player2.deck.cards[0].rank
      turn.player2.deck.cards << turn.player1.deck.cards.pop
    else
      turn.player1.deck.cards << turn.player2.deck.cards.pop
    end
  end
  
  def two_card_endgame(counter)
    case turn.type
    when :basic
      normal_game_play(counter)
    when :war
      if hand_winner == turn.player1
      turn.player1.deck.cards.concat(turn.player2.deck.cards.pop(2))
      elsif hand_winner == turn.player2
        turn.player2.deck.cards.concat(turn.player1.deck.cards.pop(2))
      end
      
    else
      'not allowed'
    end
  end

  def normal_game_play(counter)
    case turn_type
    when :mutually_assured_destruction
      turn.pile_cards
      p "turn #{counter}: No winner: mutually assured destruction 6 cards removed"
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    when :war
      turn.pile_cards
      p "turn #{counter}: WAR -  #{hand_winner.name} won #{turn.spoils_of_war.count} cards"
      turn.award_spoils(hand_winner)
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    when :basic
      turn.pile_cards
      p "turn #{counter}: #{hand_winner.name} won #{turn.spoils_of_war.count} cards"
      turn.award_spoils(hand_winner)
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    else
      'uh oh'
    end
  end
end
