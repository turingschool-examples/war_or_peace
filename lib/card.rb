class Card

  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  # def silver?
  #   if @color == 'silver'
  #     return true
  #   else
  #     false
  #   end
  # end

 # def say (message)
 #   "**;* #{message} **;*"
 # end


end
