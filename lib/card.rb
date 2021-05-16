# require './lib/deck'

class Card
  attr_reader :suit
              :value
              :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  def suit
  end

  def value
  end

  def rank
  end
end
# define the methods listed above

# close... but choose an element from each array
# also assign the proper value
# Couldn't this be done in the deck, though?
  # def suit
  #   suit = [:diamond, :heart, :spade, :club]
  # end
  #
  # def value
  #   value = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  # end
  #
  # def rank
  #   rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  # end
