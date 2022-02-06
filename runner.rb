require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require 'pry'

#Initialization - Setup up two players with two *RANDOM* decks of 26 cards.
#OH MY GOD there is actually a built-in array.shuffle method. SO appropriate!
#No actually, the set up needs to be within the GO method because we need access to player variables 🤦‍♂️


#Everything is set, let's welcome the user to this simulated game!



def lets_play()
  full_deck = [Card.new(:heart, '1', 1), Card.new(:heart, '2', 2), Card.new(:heart, '3', 3), Card.new(:heart, '4', 4), Card.new(:heart, '5', 5), Card.new(:heart, '6', 6), Card.new(:heart, '7', 7), Card.new(:heart, '8', 8), Card.new(:heart, '9', 9), Card.new(:heart, '10', 10), Card.new(:heart, 'Jack', 11), Card.new(:heart, 'Queen', 12), Card.new(:heart, 'King', 13), Card.new(:heart, 'Ace', 14), Card.new(:diamond, '1', 1), Card.new(:diamond, '2', 2), Card.new(:diamond, '3', 3), Card.new(:diamond, '4', 4), Card.new(:diamond, '5', 5), Card.new(:diamond, '6', 6), Card.new(:diamond, '7', 7), Card.new(:diamond, '8', 8), Card.new(:heart, '9', 9), Card.new(:diamond, '10', 10), Card.new(:diamond, 'Jack', 11), Card.new(:diamond, 'Queen', 12), Card.new(:diamond, 'King', 13), Card.new(:diamond, 'Ace', 14), Card.new(:club, '1', 1), Card.new(:club, '2', 2), Card.new(:club, '3', 3), Card.new(:club, '4', 4), Card.new(:club, '5', 5), Card.new(:club, '6', 6), Card.new(:club, '7', 7), Card.new(:club, '8', 8), Card.new(:club, '9', 9), Card.new(:club, '10', 10), Card.new(:club, 'Jack', 11), Card.new(:club, 'Queen', 12), Card.new(:club, 'King', 13), Card.new(:club, 'Ace', 14), Card.new(:spade, '1', 1), Card.new(:spade, '2', 2), Card.new(:spade, '3', 3), Card.new(:spade, '4', 4), Card.new(:spade, '5', 5), Card.new(:spade, '6', 6), Card.new(:spade, '7', 7), Card.new(:spade, '8', 8), Card.new(:spade, '9', 9), Card.new(:spade, '10', 10), Card.new(:spade, 'Jack', 11), Card.new(:spade, 'Queen', 12), Card.new(:spade, 'King', 13), Card.new(:spade, 'Ace', 14),]

  shuffled_deck = full_deck.shuffle #creates a randomly shuffled array of card objets
  player1_deck = Deck.new(shuffled_deck[0..25]) #player1 takes top half
  player2_deck = Deck.new(shuffled_deck[26..51]) #player2 takes bottom half

  player1 = Player.new("Megan", player1_deck)
  player2 = Player.new("Aurora", player2_deck)

  1000000.times do |turn_counter|
    turn = Turn.new(player1, player2)
    #Provide output for the user...
    #binding.pry
    if turn.type == :basic
      p "#{turn_counter}. #{turn.winner.name} won 2 cards"
    elsif turn.type == :war
      p "#{turn_counter}. WAR - #{turn.winner.name} won 6 cards"
    else
      p "#{turn_counter}. *mutually assured destruction* 6 cards removed from play"
    end
    #... then do the work to change the game state, and determine if the game is over
    turn.pile_cards
    turn.award_spoils
    #binding.pry
    if turn.player1.has_lost? || turn.player2.has_lost?
    return "#{turn.winner.name} has won the game!".center(5, "* ~ ") #break will only break the if loop, return will break the method!
    end
    player1 = turn.player1
    player2 = turn.player2
    # binding.pry
    p "Megan has #{player1.deck.cards.length} cards left"
    p "Aurora has #{player2.deck.cards.length} cards left"
  end
  return "DRAW".center(5, "-")
end
#YEAH FLOW CONTROL
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!" #I'm sensing a GO method...

input = gets.chomp
loop do
  if input == "GO"
    p lets_play()
    break
  elsif input == "exit"
    break
  else
    p "Invalid input"
    input = gets.chomp
  end
end
