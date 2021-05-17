class Game
  attr_reader :complete_deck

  def initialize
    @complete_deck = []
  end

  def start
    p "Let the game of War or Peace being!"
    p "The players Billy and Bob will each have a deck of cards to battle with"
    p "Input 'Begin' to start playing"

    play_game = gets.chomp

    if play_game == "Begin" || play_game == "begin"
      init_deck
    else
      p "Try again, type Begin or begin"
    end


    def init_deck
      suit = [:heart, :diamond, :spade, :club]
      values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace']
      ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

      suits.each do |suits|
        ranks.each do |rank|
          @complete_deck << Card.new(rank,suit)
        end
      end
    end



end
