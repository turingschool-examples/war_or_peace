
class Person

  attr_accessor :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @cards=[] ? true : false
  end

end
