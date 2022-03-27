require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'



class Game
  def make_deck#makes my deck
    suits = [:heart, :diamond, :spades, :club]#give the suits of my deck thatll be made
    ranks_values = [#passing in my rank and values into the array of cards I will make
      [2, '2'],
      [3, '3'],
      [4, '4'],
      [5, '5'],
      [6, '6'],
      [7, '7'],
      [8, '8'],
      [9, '9'],
      [10, '10'],
      [11, 'Jack'],
      [12, 'Queen'],
      [13, 'King'],
      [14, 'Ace']]

    @standard_deck = []#making my deck as an empty array because i need to add the above into the array

    suits.map do |suits|#calling my suits array and using .map i can pass my suits to my other arrays
      ranks_values.map do |rank, value|#calling my rank_value array and using .map to pass my arguments
        card = Card.new(suit, value, rank)#saying that my Card class will make a deck calling everything above and putting them together to make an array with 52 cards ranked valued and suited
        @standard_deck << card#pushing the card variable above into my empty standard_deck array putting everything together
      end
    end
  end

  def split_deck#making a method to split my deck can be called to give my players a deck
    @deck1 = (deck1 = Deck.new(@standard_deck[0..25]))#calling my Deck class to make a new deck using my above standard_deck variable and putting an array into it with 26 cards
    @deck2 = (deck2 = Deck.new(@standard_deck[26..51]))#using the .. will making the program give me all the numbers between 26 and 51 its 51 because of the 0 index
  end

  def shuffle_deck#method will shuffle the deck
    @standard_deck.shuffle!#.shuffle! is a ruby method that randomizes an array
  end

  def add_players#making my players for the game of war or peace
    @player1 = (player1 = Player.new('Megan', @deck1))#calling my Player class to populate the player1 passing 2 arguments to my Player parameter
    @player2 = (player2 = Player.new('Aurora', @deck2))
  end


  def start

    turn_count = 0
    loop do
      turn_count += 1
      if turn_count == 1000001
        break
      end

      

      if @type == :basic && @player1.winner
          p "Megan won 2 cards"
      else
          p "Aurora won 2 cards"
      end
        if @type == :war && @player1.winner
          p "WAR - Megan won 6 cards"
        else
          p "WAR - Aurora won 6 cards"
        end
          if @type == :mutually_assured_destruction
            p "MAD MAD MAD 6 cards removed from play"
          end

    end
  end
end




game = Game.new
game.start
