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
    # four possible suits - diamond, heart, spade, club
    suits = [:diamond, :heart,:spade, :club]
  end

  def value
    # points teach card is worth based upon rank
    # ranges from 2-14
    values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  end

  def rank
    # otherwise known as the face of the card
    # ranks 2-10 are numbers
    # ranks 11-14 are face cards aka high ranking cards
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  end
end


# Scratch work:
# define the methods listed above

# close... but choose an element from each array
# also assign the proper value
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
