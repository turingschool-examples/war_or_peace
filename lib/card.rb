class Card
  attr_reader :suit, :value, :rank

  def initialize(*args)
    args = args.flatten
    @suit = args[0].to_sym
    @value = args[1]
    @rank = args[2].to_i
  end

end
