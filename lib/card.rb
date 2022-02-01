class Card()
    attr_accessor :suit, :name, :value
    def initialize(s, n, v)
      @suit = s
      @name = n
      @value = v
    end
end