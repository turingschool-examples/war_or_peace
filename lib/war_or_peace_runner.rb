require_relative './card'
require_relative './deck'
 require_relative './player'
 require_relative './turn'
 require_relative './card_generator'
 require_relative './interaction'

card1 = Card.new('2', 'Heart', 2)
card2 = Card.new('3', 'Heart', 3)
card3 = Card.new('4', 'Heart', 4)
card4 = Card.new('5', 'Heart', 5)
card5= Card.new('6', 'Heart', 6)
card6 = Card.new('7', 'Heart', 6)
card7 = Card.new('8', 'Heart', 8)
card8 = Card.new('9', 'Heart', 9)
card9 = Card.new('0', 'Heart', 10)
card10 = Card.new('Jack', 'Heart', 11)
card11= Card.new('Queen', 'Heart', 12)
card12 = Card.new('King', 'Heart', 13)
card13 = Card.new('Ace', 'Heart', 14)
cards1 = [card12, card10, card6, card7, card11, card13]
cards2 = [card2, card4, card5, card8, card3, card1]

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)
@player1 = Player.new('clarisa', deck1)
@player2 = Player.new('Aurora', deck2)
@counter = 1


def start
  @interaction = Interaction.new
  @interaction.intro
  while @counter < 101
    turn = Turn.new(@player1, @player2)
    type = turn.type
    @winner = turn.winner
    turn.pile_cards
    #every time it checks type it also re-calculates
    #use memoization stop querying and changing the value type.winner
    #can be done by sperating out calculate_type and show_type methods.
    #use memoization on show_type methods to assure you only call calculate_type once.
    if type == :basic
      @interaction.basic
    elsif type == :war
      @interaction.war
    else type == :mad
      @interaction.mutually_assured_destruction
    end
    turn.award_spoils(winner)
    @counter += 1
  end
end

start
