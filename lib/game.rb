class Game
  attr_reader :deck, :player1, :player2, :start, :turn
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @deck = []
    @start = false
    @turn_number = 0



  end

def start
  p "Welcome to War( or Peace)! This game will be played with 52 cards"
  p "The players today are #{player1.name} and #{player2.name}."
  p "Type 'GO' to start the game!"

  print "enter response here> "
  start = gets.chomp




  if start == "GO"
    @start = true
  end

  if @start == true
    until player1.has_lost? || player2.has_lost? || turn_number == 52
      turn = Turn.new(player1, player2)
      @turn_number += 1
      type = turn.type
      winner = turn.winner(type)

      if type == :basic
        turn.pile_of_cards
        p "#{winner.name} won #{turn.war_spoils_of_war.length}"
        turn.award_spoils(winner)
      elsif type == :war
        turn.pile_of_cards
        p ""
