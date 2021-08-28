require './lib/turn'

class Game
  attr_reader :full_deck,
              :deck1,
              :deck2

  def initialize
    @full_deck = [
    Card.new(:heart, 'Ace', 14),
    Card.new(:heart, 'King', 13),
    Card.new(:heart, 'Queen', 12),
    Card.new(:heart, 'Jack', 11),
    Card.new(:heart, '10', 10),
    Card.new(:heart, '9', 9),
    Card.new(:heart, '8', 8),
    Card.new(:heart, '7', 7),
    Card.new(:heart, '6', 6),
    Card.new(:heart, '5', 5),
    Card.new(:heart, '4', 4),
    Card.new(:heart, '3', 3),
    Card.new(:heart, '2', 2),
    Card.new(:diamond, 'Ace', 14),
    Card.new(:diamond, 'King', 13),
    Card.new(:diamond, 'Queen', 12),
    Card.new(:diamond, 'Jack', 11),
    Card.new(:diamond, '10', 10),
    Card.new(:diamond, '9', 9),
    Card.new(:diamond, '8', 8),
    Card.new(:diamond, '7', 7),
    Card.new(:diamond, '6', 6),
    Card.new(:diamond, '5', 5),
    Card.new(:diamond, '4', 4),
    Card.new(:diamond, '3', 3),
    Card.new(:diamond, '2', 2),
    Card.new(:spade, 'Ace', 14),
    Card.new(:spade, 'King', 13),
    Card.new(:spade, 'Queen', 12),
    Card.new(:spade, 'Jack', 11),
    Card.new(:spade, '10', 10),
    Card.new(:spade, '9', 9),
    Card.new(:spade, '8', 8),
    Card.new(:spade, '7', 7),
    Card.new(:spade, '6', 6),
    Card.new(:spade, '5', 5),
    Card.new(:spade, '4', 4),
    Card.new(:spade, '3', 3),
    Card.new(:spade, '2', 2),
    Card.new(:club, 'Ace', 14),
    Card.new(:club, 'King', 13),
    Card.new(:club, 'Queen', 12),
    Card.new(:club, 'Jack', 11),
    Card.new(:club, '10', 10),
    Card.new(:club, '9', 9),
    Card.new(:club, '8', 8),
    Card.new(:club, '7', 7),
    Card.new(:club, '6', 6),
    Card.new(:club, '5', 5),
    Card.new(:club, '4', 4),
    Card.new(:club, '3', 3),
    Card.new(:club, '2', 2)
  ]
    shuffled_deck = @full_deck.sample(52)
    @deck1 = Deck.new(shuffled_deck[0..25])
    @deck2 = Deck.new(shuffled_deck[26..51])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
end

  def start
    response = gets.chomp
    turn_count = 1
    if response == "GO"
      while @player1.has_lost? == false && @player2.has_lost? == false
        turn = Turn.new(@player1, @player2)
        turn.pile_cards
        turn.award_spoils
        puts "Turn #{turn_count}: #{turn.type if turn.type == :mutually_assured_destruction} #{@player2.deck.cards.count}"

        if @player1.has_lost? == true || @player2.has_lost? == true
          puts 'GAME OVER'
          break
        elsif turn_count == 1_000_000
          puts "---- DRAW ----"
          break
        end
        turn_count += 1
      end
    else
      p "You have entered something besides GO"
    end
  end
end

game = Game.new



puts """Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"""
game.start
