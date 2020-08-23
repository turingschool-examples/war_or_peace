class Game
  attr_reader :standard_deck, :deck1, :deck2, :player1, :player2, :turn
  def initialize
    @standard_deck = Deck.new
    @deck1 = Deck.new
    @deck2 = Deck.new
  end

  def prepare_deck
    standard_deck.populate_standard_deck
    standard_deck.shuffle_deck
    standard_deck.cut_deck
    deck1.cards << standard_deck.cut_cards[0]
    deck1.cards.flatten!
    deck2.cards << standard_deck.cut_cards[1]
    deck2.cards.flatten!
  end

  def deal_cards(player1, player2)
    @player1 = Player.new(player1, deck1)
    @player2 = Player.new(player2, deck2)
  end

  def intro
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    go = gets.chomp
    if go == 'GO'
      # go?
    else
      puts "Whoops! We were looking for 'GO', not #{go}. Try again!"
    end
  end

  # def turn_loop
  #   loop do |turn_number|
  #     if @player1.has_lost?
  #       p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
  #       break
  #     end
  #     if @player2.has_lost?
  #       p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
  #       break
  #     end
  #     if turn_number == 1000000
  #       p "---- DRAW ----"
  #       break
  #     end
  #     @turn = Turn.new(@player1, @player2)
  #     winner = turn.winner
  #     winner_name = winner.name
  #     turn.pile_cards
  #     turn.award_spoils(winner)
  #     if @turn.type == :basic
  #       p "Turn #{turn_number}: #{winner_name} won 2 cards"
  #     elsif @turn.type == :war
  #       p "Turn #{turn_number}: WAR - #{winner_name} won 6 cards"
  #     else
  #       "Turn #{turn_number}: *mutually assured destruction* 6 cards removed from play"
  #     end
  #   end

    def turn_loop
      turn_number = 1
      until @player1.has_lost? || @player2.has_lost? || turn_number == 1000000
        @turn = Turn.new(@player1, @player2)
        winner = turn.winner
        winner_name = winner.name
        turn.pile_cards
        turn.award_spoils(winner)
        if @turn.type == :basic
          puts "Turn #{turn_number}: #{winner_name} won 2 cards"
        elsif @turn.type == :war
          puts "Turn #{turn_number}: WAR - #{winner_name} won 6 cards"
        else
          puts "Turn #{turn_number}: *mutually assured destruction* 6 cards removed from play"
        end
        turn_number += 1
      end
      if @player1.has_lost?
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      elsif @player2.has_lost?
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      else
        puts "---- DRAW ----"
      end
    end

# Start method
# def start(player1, player2)
# prepare deck
# deal cards(player1, player2)
# print intro
# start turn_loop


end
