class Start
  attr_reader :greeting

  def initialize(greeting)
    @greeting = greeting
  end
end

def greeting
  line_1 = 'Welcome to War! (or Peace) This game will be played with 52 cards.'
  line_2 = 'The players today are Megan and Aurora.'
  line_3 = "Type 'GO' to start the game!"
  line_4 = '------------------------------------------------------------------'
  return "#{line_1}\n#{line_2}\n#{line_3}\n#{line_4}\n"
end

# puts "TURN 1"
# puts turn.type
# winner = turn.winner
# puts winner.name
#
# puts "spoils before pile"
# p turn.spoils_of_war.length
#
# turn.pile_cards
# puts "spoils after pile"
# p turn.spoils_of_war.length
# turn.award_spoils(winner)
#
#
# puts player1.deck.cards.length
# puts player2.deck.cards.length
# puts "spoils after award"
# p turn.spoils_of_war.length
