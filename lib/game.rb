class Game
  def initialize(turn)
  end



  def start
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    p 'The players today are Megan and Aurora.'
    p 'Type 'GO' to start the game!'
  end

 until player1.has_lost? == true || player2.has_lost? == true or
   turn_counter == 1000000
   if
  p "Turn #{turn_counter}: #{turn.winner} "

   #turn methods
   turn_counter += 1
   Turn 1: Megan won 2 cards
   Turn 2: WAR - Aurora won 6 cards
   Turn 3: *mutually assured destruction* 6 cards removed from play
   if
  p "Turn #{turn_counter}: #{turn.winner} "
