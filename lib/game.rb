class Game
  attr_reader :deck, :player1, :player2, :start, :turn
  def initialize

    @deck = []
    deck_generator
    shuffled_decks = deck_splitter
    @start = false
    @turn_number = 0
    @player1 = Player.new("Megan", shuffled_decks[0])
    @player2 = Player.new("Aurora", shuffled_decks[1])

  end





def deck_generator
  card_suit = %i[heart club diamond spade]
  card_rank = {:two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven =>7, :eight =>8, :nine => 9, :ten => 10, :jack =>11, :queen => 12, :king => 13, :ace => 14}
  card_rank.map do |k,v|
    card_suit.map do |suit|
      @deck << Card.new( suit, k,v )
    end
  end
end

def deck_splitter
  @deck.shuffle!
  split_deck1 = @deck[0..25]
  split_deck2 = @deck[26..51]
  deck1 = Deck.new(split_deck1)
  deck2 = Deck.new(split_deck2)
  deck1.cards.flatten!
  deck2.cards.flatten!
  @shuffled_decks = [deck1, deck2]
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
    until player1.has_lost? || player2.has_lost? || @turn_number == 52

      turn = Turn.new(player1, player2)
      @turn_number += 1
      type = turn.type
      winner = turn.winner

      if type == :basic
        turn.pile_of_cards(type)
        p "Turn #{@turn_number}: #{winner.name} won #{turn.spoils_of_war.length}cards!"
        turn.award_spoils(winner)

      elsif type == :war
        turn.pile_of_cards(type)
        p "Turn #{@turn_number}: War - #{winner.name} won #{turn.spoils_of_war.length}cards!"
        turn.award_spoils(winner)
      elsif type == :mutually_assured_destruction
        turn.pile_of_cards(type)
        p "Turn #{@turn_number}:* mutually assured destruction * #{turn.spoils_of_war.length} cards removed from play"
      end


      if @turn_number == 52
          p "-----Draw-----"
      elsif player1.has_lost?
          puts "Turn #{@turn_number}:*-*-*-* #{player2.name} has won the game! *-*-*-*"
      elsif player2.has_lost?
          puts "Turn #{@turn_number}:*-*-*-* #{player1.name} has won the game! *-*-*-*"
      end

   end
 end
end
end
