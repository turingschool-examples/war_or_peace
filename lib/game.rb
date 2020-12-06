class Game
  attr_reader :cards,
              :suits,
              :values,
              :player1,
              :player2

  def initialize
    @player1 = player1
    @player2 = player1
    @cards        = []
    @suits        = [:heart, :diamond, :club, :spade]
    @values       = {
                      "Ace" => 1,
                      "2" =>  2,
                      "3" => 3,
                      "4"=> 4,
                      "5" => 5,
                      "6" => 6,
                      "7" => 7,
                      "8" => 8,
                      "9" => 9,
                      "10" => 10,
                      "Jack" => 11,
                      "Queen" => 12,
                      "King" => 13
                    }
  end

  def create_cards
    @suits.each do |suit|
      @values.each do |value, rank|
          card = Card.new(suit, value, rank)
          @cards << card
      end
    end
  end 

  def shuffle 
    @cards.shuffle!
  end

  def split_cards
    shuffle

    deck1 = Deck.new(@cards[0..25])
    deck2 = Deck.new(@cards[26..51])

    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)
  end

  def start 
    puts "Welcome to War! (or Peace)!\nThis game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n----------------------------------------"

    print ">"
    play_game = gets.chomp.upcase 

    if play_game == "GO"
      create_cards
      split_cards
      until Turn.turn_count == 1_000_000 ||(@player1.has_lost? || @player2.has_lost?) do
        turn = Turn.new(@player1, @player2)
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        turn.turn_result
      end
      turn.end_result
    end
  end
end