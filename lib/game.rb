class Game
  attr_reader :full_deck#, :player1, :player2

  def initialize
    deck = full_deck.cards.shuffle!
# require "pry"; binding.pry
    @player1 = Player.new("Megan", Deck.new(deck[0..25])) #
    @player2 = Player.new("Aurora", Deck.new(deck[26..51])) #
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    user_input = gets.chomp.upcase

    if user_input == "GO"
      full_deck
      turns
    else
      p "Hmm... not quite. Try again. Type 'GO' to start the game!"
      self.start
    end
  end

  def full_deck
    card1 = Card.new(:spade, 'Ace', 14)
    card2 = Card.new(:spade, '2', 2)
    card3 = Card.new(:spade, '3', 3)
    card4 = Card.new(:spade, '4', 4)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:spade, '6', 6)
    card7 = Card.new(:spade, '7', 7)
    card8 = Card.new(:spade, '8', 8)
    card9 = Card.new(:spade, '9', 9)
    card10 = Card.new(:spade, '10', 10)
    card11 = Card.new(:spade, 'Jack', 11)
    card12 = Card.new(:spade, 'Queen', 12)
    card13 = Card.new(:spade, 'King', 13)
    card14 = Card.new(:heart, 'Ace', 14)
    card15 = Card.new(:heart, '2', 2)
    card16 = Card.new(:heart, '3', 3)
    card17 = Card.new(:heart, '4', 4)
    card18 = Card.new(:heart, '5', 5)
    card19 = Card.new(:heart, '6', 6)
    card20 = Card.new(:heart, '7', 7)
    card21 = Card.new(:heart, '8', 8)
    card22 = Card.new(:heart, '9', 9)
    card23 = Card.new(:heart, '10', 10)
    card24 = Card.new(:heart, 'Jack', 11)
    card25 = Card.new(:heart, 'Queen', 12)
    card26 = Card.new(:heart, 'King', 13)
    card27 = Card.new(:diamond, 'Ace', 14)
    card28 = Card.new(:diamond, '2', 2)
    card29 = Card.new(:diamond, '3', 3)
    card30 = Card.new(:diamond, '4', 4)
    card31 = Card.new(:diamond, '5', 5)
    card32 = Card.new(:diamond, '6', 6)
    card33 = Card.new(:diamond, '7', 7)
    card34 = Card.new(:diamond, '8', 8)
    card35 = Card.new(:diamond, '9', 9)
    card36 = Card.new(:diamond, '10', 10)
    card37 = Card.new(:diamond, 'Jack', 11)
    card38 = Card.new(:diamond, 'Queen', 12)
    card39 = Card.new(:diamond, 'King', 13)
    card40 = Card.new(:clubs, 'Ace', 14)
    card41 = Card.new(:clubs, '2', 2)
    card42 = Card.new(:clubs, '3', 3)
    card43 = Card.new(:clubs, '4', 4)
    card44 = Card.new(:clubs, '5', 5)
    card45 = Card.new(:clubs, '6', 6)
    card46 = Card.new(:clubs, '7', 7)
    card47 = Card.new(:clubs, '8', 8)
    card48 = Card.new(:clubs, '9', 9)
    card49 = Card.new(:clubs, '10', 10)
    card50 = Card.new(:clubs, 'Jack', 11)
    card51 = Card.new(:clubs, 'Queen', 12)
    card52 = Card.new(:clubs, 'King', 13)

    @cards = [card1, card2, card3, card4, card5, card6,
      card7, card8, card9, card10, card11, card12, card13, card14,
      card15, card16, card17, card18, card19, card20, card21, card22,
      card23, card24, card25, card26, card27, card28, card29, card30,
      card31, card32, card33, card34, card35, card36, card37, card38,
      card39, card40, card41, card42, card43, card44, card45, card46,
      card47, card48, card49, card50, card51, card52]

    Deck.new(@cards)
  end

  def turns
    @turn = Turn.new(@player1, @player2)

    # @turn.player1 #
    # @turn.player2 #

    @count = 0

    loop do
      @count +=1

      @turn.pile_cards

      if @count == 1010000
        p "---- DRAW ----"
        break

      elsif @turn.type == :mutually_assured_destruction
        p "Turn #{@count}: *mutually assured destruction* 6 cards removed from play"

        if @player1.has_lost?
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break

        elsif @player1.has_lost?
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
        end

      elsif @turn.type == :basic
        p "Turn #{@count}: #{@turn.winner.name} won 2 cards"
        @turn.award_spoils(@turn.winner)

        if @player1.has_lost?
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
        elsif @player1.has_lost?
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
        end

      elsif @turn.type == :war
        p "Turn #{@count}: WAR - #{@turn.winner.name} won 6 cards"
        @turn.award_spoils(@turn.winner)

        if @player1.has_lost?
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
        elsif @player1.has_lost?
          p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
        end
      end



      # if @count == 100#0000
      #   p "---- DRAW ----"
      # end

      p @player1.deck.cards.length
    end
  end
end
