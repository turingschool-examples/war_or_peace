class Game
  attr_reader :deck_filled

  def initialize
    @deck_filled = []
  end

  def make_deck
      card1 = Card.new(:diamond, '2', 2)
      card2 = Card.new(:diamond, '3', 3)
      card3 = Card.new(:diamond, '4', 4)
      card4 = Card.new(:diamond, '5', 5)
      card5 = Card.new(:diamond, '6', 6)
      card6 = Card.new(:diamond, '7', 7)
      card7 = Card.new(:diamond, '8', 8)
      card8 = Card.new(:diamond, '9', 9)
      card9 = Card.new(:diamond, '10', 10)
      card10 = Card.new(:diamond, 'Jack', 11)
      card11 = Card.new(:diamond, 'Queen', 12)
      card12 = Card.new(:diamond, 'King', 13)
      card13 = Card.new(:diamond, 'Ace', 14)

      card14 = Card.new(:heart, '2', 2)
      card15 = Card.new(:heart, '3', 3)
      card16 = Card.new(:heart, '4', 4)
      card17 = Card.new(:heart, '5', 5)
      card18 = Card.new(:heart, '6', 6)
      card19 = Card.new(:heart, '7', 7)
      card20 = Card.new(:heart, '8', 8)
      card21 = Card.new(:heart, '9', 9)
      card22 = Card.new(:heart, '10', 10)
      card23 = Card.new(:heart, 'Jack', 11)
      card24 = Card.new(:heart, 'Queen', 12)
      card25 = Card.new(:heart, 'King', 13)
      card26 = Card.new(:heart, 'Ace', 14)

      card27 = Card.new(:spade, '2', 2)
      card28 = Card.new(:spade, '3', 3)
      card29 = Card.new(:spade, '4', 4)
      card30 = Card.new(:spade, '5', 5)
      card31 = Card.new(:spade, '6', 6)
      card32 = Card.new(:spade, '7', 7)
      card33 = Card.new(:spade, '8', 8)
      card34 = Card.new(:spade, '9', 9)
      card35 = Card.new(:spade, '10', 10)
      card36 = Card.new(:spade, 'Jack', 11)
      card37 = Card.new(:spade, 'Queen', 12)
      card38 = Card.new(:spade, 'King', 13)
      card39 = Card.new(:spade, 'Ace', 14)

      card40 = Card.new(:club, '2', 2)
      card41 = Card.new(:club, '3', 3)
      card42 = Card.new(:club, '4', 4)
      card43 = Card.new(:club, '5', 5)
      card44 = Card.new(:club, '6', 6)
      card45 = Card.new(:club, '7', 7)
      card46 = Card.new(:club, '8', 8)
      card47 = Card.new(:club, '9', 9)
      card48 = Card.new(:club, '10', 10)
      card49 = Card.new(:club, 'Jack', 11)
      card50 = Card.new(:club, 'Queen', 12)
      card51 = Card.new(:club, 'King', 13)
      card52 = Card.new(:club, 'Ace', 14)

      @deck_filled = [card1, card2, card3, card4, card5, card6, card7, card8, card9,
         card10, card11, card12, card13, card14, card15, card16, card17, card18,
         card19, card20, card21, card22, card23, card24, card25, card26, card27,
         card28, card29, card30, card31, card32, card33, card34, card35, card36,
         card37, card38, card39, card40, card41, card42, card43, card44, card45,
         card46, card47, card48, card49, card50, card51, card52]

      @deck_filled.shuffle!
    end

  def start_game
    puts ""
    puts "Welcome to War! (or Peace)"
    puts "This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "---------------------------------------"

    go_check = gets.chomp

    if go_check == "GO"
      make_deck
      run_game
    else
      puts " "
      puts "That ain't it bro, you gotta type GO!"
      puts "Press Enter to try again"
      gets.chomp
      self.start_game
    end
  end

  def run_game
    deck1 = Deck.new(@deck_filled[0..25])
    deck2 = Deck.new(@deck_filled[26..51])
    player1 = Player.new("Nick", deck1)
    player2 = Player.new("Sarah", deck2)

    @game_turn = 0

    loop do
      @game_turn += 1
      turn = Turn.new(player1,player2)
      @turn_type = turn.type
      if @turn_type == :basic or @turn_type == :war
        @turn_winner = turn.winner.name
      end
      turn.pile_cards
      turn.award_spoils
      turn_output

      if player1.has_lost?
        puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
        break
      elsif player2.has_lost?
        puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
        break
      end

      if @game_turn == 1000000
        p "---- DRAW ----"
        break
      end
    end
  end

  def turn_output
    if @turn_type == :basic
      p "Turn #{@game_turn}: #{@turn_winner} has won 2 cards!"
    elsif @turn_type == :war
      p "Turn #{@game_turn}: WAR - #{@turn_winner} won 6 cards!"
    elsif @turn_type == :mutually_assured_destruction
      p "Turn #{@game_turn}: *Mutually Assured Destruction* 6 cards removed from play!"
    elsif @turn_type == :draw
      p "Turn #{@game_turn}: Draw! Shuffling Decks..."
    end
  end

end
