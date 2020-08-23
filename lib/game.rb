class Game
  attr_reader :player1, :player2, :all_cards

  SUITS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
  VALUES_TO_RANK = {
    '2' => 1,
    '3' => 2,
    '4' => 3,
    '5' => 4,
    '6' => 5,
    '7' => 6,
    '8' => 7,
    '9' => 8,
    '10' => 9,
    'J' => 10,
    'Q' => 11,
    'K' => 12,
    'A' => 13,
  }

  def initialize
    all_cards = build_cards
    deck_1, deck_2 = split_deck(all_cards)

    @player1 = Player.new("Megan", deck_1)
    @player2 = Player.new("Aurora", deck_2)
  end

  def build_cards
    all_cards = []
    SUITS.each do |suit|
      VALUES_TO_RANK.each do |value, rank|
        all_cards << Card.new(value, suit, rank)
      end
    end
    all_cards
  end

  def split_deck(all_cards)
    all_cards.shuffle!
    deck_1 = Deck.new(all_cards.first(26))
    deck_2 = Deck.new(all_cards.last(26))

    [deck_1, deck_2]
  end

  def start
    turn_counter = 1

    until @player1.has_lost? || @player2.has_lost? || turn_counter == 100000

      turn = Turn.new(@player1, @player2)

      type = turn.type
      winner = turn.winner
      turn.pile_cards
      if type == :basic
        puts "Turn #{turn_counter} #{winner.name} won 2 cards"
        turn.award_spoils(winner)

      elsif type == :war
        puts "Turn #{turn_counter} WAR - #{winner.name} won 6 cards"
        turn.award_spoils(winner)

      elsif type == :mutually_assured_destruction
        puts "Turn #{turn_counter} *mutually assured destruction* 6 cards removed from play"
      end

      turn_counter += 1
    end

    if turn_counter >= 100000
      puts "---- DRAW ----"
    elsif @player1.has_lost?
      puts  "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    else
      puts  "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    end
  end
end
