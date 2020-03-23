require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


deck = []
suits = [:heart, :diamond, :spade, :club]
ranks = (2..14).to_a

rank_value_pairs = {}
ranks.each  {|rank|
  key = rank
  value = rank.to_s
    if value == "11"
      value = "Jack"
    elsif value == "12"
      value = "Queen"
    elsif value == "13"
      value = "King"
    elsif value == "14"
      value = "Ace"
    end
  rank_value_pairs[key] = value
}

suits.each {|suit|
    rank_value_pairs.each do |rank, value|
    deck << Card.new(suit, value, rank)
  end}

  shuffled_cards = deck.shuffle
  deck1 = Deck.new(shuffled_cards.slice(0, 26))
  deck2 = Deck.new(shuffled_cards.slice(27, 52))

  player1 = Player.new('Huxley', deck1)
  player2 = Player.new('Petra', deck2)

  game = Game.new(player1, player2)
  game.start_game

class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def start_game
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------'
    respose = gets.chomp.upcase
    if respose == 'GO'
      play_game
    else
      p  'Try Again!'
    end
  end

  def play_game
    turn = Turn.new(player1, player2)

    until player1.has_lost? || player2.has_lost?
     if turn.type == :basic
       winner = move.winner
       turn.pile_cards
       turn.award_spoils(winner)
       turn_count += 1
       p "Turn #{turn_count}: #{winner.name} won 2 cards"

     elsif turn.type == :war
       winner = turn.winner
       turn.pile_cards
       turn.award_spoils(winner)
       turn_count += 1
       p "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"

     elsif turn.type == :mutually_assured_destruction
       turn.pile_cards
       turn_count += 1
       p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
     end
     break if turn_count == 1000000
    end



  end


end
