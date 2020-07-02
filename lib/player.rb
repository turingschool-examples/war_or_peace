class Player

  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # found an error with the way I originally wrote this
    # Started researching variables equal to zero
    # Then started researching it as an array
    # learned that "empty arrays" may show as truthy-y in ruby
    # I may have to try something entirely different
    # Error message is telling me .length, .size, .count won't work...
    # Found a method to try (.empty?)
    # Okay... that method comes back an error
    # I KNOW that these are array methods that should work,
    # So... something else is the issue
    # Taking a break to try again

    # if deck == 0
    # if deck == []
    # if deck.length == 0
    # if deck !![]
    # if deck.size < 1
    if deck.empty?
      p "#{name} has lost the war.! The battle drums still call, perhaps your luck will be better next time."
    else
      p "#{name} is still in the running for the war!"
    end
  end
end
