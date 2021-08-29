require './card.rb'
require './deck.rb'
require './player.rb'
require './turn.rb'



# I ran out of time, so I just wrote what I can without debugging anything.
# No test files. I will be more mindful of how much
#time I spend on one unruly method. Sorry about the mess!

# create 52 cards

full_deck_of_cards = []
suits = ["spade", "diamond", "heart", "club"]


# ??? ask someone about symbols.  how do you use it outside hash?

hash_value_rank = {:2 => 2, :3 => 3, :4 => 4, :5 => 5, :6 => 6, :7 => 7, :8  => 8, :9 => 9, :10 => 10, :jack => 11, :queen => 12, :king => 13, :ace => 14}

suits.each do |suit|
  hash_value_rank.each do |key, value|
    card = Card.new(suit, key, value)
    full_deck_of_cards << card
  end
end

#alternatively. although none of them works.

value = [:2, :3, :4, :5, :6, :7, :8, :9, :10, :jack, :queen, :king, :ace]
#OR value = [':2', ':3', ':4', ':5', ':6', ':7', ':8', ':9', ':10', ':jack', ':queen', ':king', ':ace']

rank = 2

suits.each do |suit|
  value.each do |value|
    card = Card.new(suit, value, rank)
    rank += 1
    full_deck_of_cards << card
  end
end



# shuffle cards and divide them equally into two decks

full_deck_of_cards.shuffle!

half_deck_of_cards1 = full_deck_of_cards[0..25]
half_deck_of_cards2 = full_deck_of_cards[26..51]

deck1 = Deck.new(half_deck_of_cards1)
deck2 = Deck.new(half_deck_of_cards2)

# create two players with the Decks you created

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)



#start the game using a new method called start
#THIS METHOD WILL NEED TO BE INCLUDED IN A CLASS - IT IS UP TO YOU WHICH CLASS
#EITHER IN EXISTING OR A NEW CLASS


def start

  p "Welcome to War! (or Peace) This game will be played with 52 cards."
  p "The players today are Megan and Aurora."
  p "Type 'GO' to start the game!"

  answer = gets.chomp

  if answer.upcase == "GO"

    turn_count = 0

    while turn_count < 1000000

      until (player1.has_lost? == true) || (player2.has_lost == true)
        turn = Turn.new.(player1, player2)
        turn_type = turn.type
        winner_of_turn = turn.winner
        turn.pile_cards
        turn.award_spoils(winner_of_turn)
        turn_count += 1

        if turn_type == :basic
          p "Turn #{turn_count}: #{winner_of_turn} won 2 cards"
        elsif turn_type == :war
          p "Turn #{turn_count}: War - #{winner_of_turn} won 6 cards"
        else
          p "Turn #{turn_count}: *Mutually Assured Destruction!* - 6 cards removed"
        end


      end

      if turn_count == 1000000
        p "--------- DRAW ---------"

      else
        p "~*~*~* #{winner_of_turn} has won the game! ~*~*~*"

      end

    end


  elsif answer.upcase != "GO"

    p "Too bad! Maybe next time!"

  end

end

start
