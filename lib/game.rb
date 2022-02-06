#'./lib/game'
require './lib/card_generator'

class Game
def welcome_banner
  puts "---------------------------------------------------------------------"
  puts " Welcome to War! (or Peace) This game will be played with 52 cards."
  puts "   The players today are Megan and Aurora."
  puts "   Type 'GO' to start the game!"
  puts "   Type 1 to play the game using the file cards.txt"
  puts "---------------------------------------------------------------------"
  puts ""
end

def user_input
  input = gets.chomp
  input = input.upcase

  if (input == "GO" || input == "1" )
    return  input
  else
    return false
  end

end

def make_deck(kind_of_deck)
  if kind_of_deck == "file"
    gen_cards = CardGenerator.new('./cards.txt')
    cards = gen_cards.cards

  elsif kind_of_deck == "normal"

    # array of possible suits
    suits = [:heart, :spade, :diamond, :club]
    #array to hold cards of each suit
    cards = []
    #create cards for the deck
    suits.each do |suit|
        cards << Card.new(suit, '2',2)
        cards << Card.new(suit, '3',3)
        cards << Card.new(suit, '4',4)
        cards << Card.new(suit, '5',5)
        cards << Card.new(suit, '6',6)
        cards << Card.new(suit, '7',7)
        cards << Card.new(suit, '8',8)
        cards << Card.new(suit, '9',9)
        cards << Card.new(suit, '10',10)
        cards << Card.new(suit, 'Jack',11)
        cards << Card.new(suit, 'Queen',12)
        cards << Card.new(suit, 'King',13)
        cards << Card.new(suit, 'Ace',14)
    end

  end
    #Shuffle the cards and split into to decks
    a = cards.shuffle
    deck1,deck2 = a.each_slice( (a.size/2).round ).to_a
    #create 2 decks to pass to players
    @player1_deck = Deck.new(deck1)
    @player2_deck = Deck.new(deck2)
end

  def start
    #create 2 players
    player1 = Player.new('Megan', @player1_deck)
    player2 = Player.new('Aurora',@player2_deck)

    # Take a turn
    turn_count = 0
    turn = Turn.new(player1, player2)

    while ((player1.deck.cards).length >= 0) &&
        ((player2.deck.cards).length >= 0) &&
        turn_count < 1000000

      player1_deck_size = player1.deck.cards.length
      player2_deck_size = player2.deck.cards.length

#    p player1_deck_size
#    p player2_deck_size

      if player1_deck_size == 0 || player2_deck_size == 0
        break
      end

      turn_count += 1
      round_type = turn.type
      round_winner = turn.winner
      turn.pile_cards

      if round_winner != "No Winner"
        turn.award_spoils(round_winner)
      else
        puts "No winner this turn"
      end

      if round_type == :basic
        puts "Turn #{turn_count}: #{round_winner.name} won 2 cards #{round_type}"
      elsif round_type == :war
        puts "Turn #{turn_count}: WAR - #{round_winner.name} won 6 cards #{round_type}"
      elsif round_type == :mutually_assured_destruction
        puts "Turn #{turn_count}: *mutually_assured_destruction* 6 cards removed from play"
      end
    end

    if player1_deck_size == 0
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2_deck_size == 0
     puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
   elsif turn_count == 1000000
     puts "---- DRAW ----"
    end
  end
end
