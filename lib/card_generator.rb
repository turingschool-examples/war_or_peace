class CardGenerator
  attr_reader :arr, :i


  def initialize(i=0)
    @arr = []
    @i = i
  end

  def hi
    "hello"
  end

  def move_it
    @arr << @i
  end

end
