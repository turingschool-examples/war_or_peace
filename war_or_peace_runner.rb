require './lib/turn'
require './lib/card_generator'

class Game
  attr_reader :full_deck,
              :deck1,
              :deck2

  def initialize
    @full_deck = CardGenerator.new('./lib/cards.txt').cards
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
      p "You entered something besides GO, silly billy"
    end
  end
end

game = Game.new



puts """Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"""
game.start
