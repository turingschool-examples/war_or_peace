require './lib/card'

class Game
  attr_reader :deck
              :suits
  def initialize
    # @suits = [:heart, :diamond, :spade, :club]
    # @deck = []
  end
  #
  # def new_deck
  #   @suits.map do |suit|
  #     (2..14).each do |card|
  #       if card <= 10
  #         @deck << Card.new(suit, card.to_s, card)
  #       elsif card == 11
  #         @deck << Card.new(suit, "Jack", card)
  #       elsif card == 12
  #         @deck << Card.new(suit, "Queen", card)
  #       elsif card == 13
  #         @deck << Card.new(suit, "King", card)
  #       elsif card == 14
  #         @deck << Card.new(suit, "Ace", card)
  #       end
  #     @deck = @deck.shuffle
  #     end
  #   end
  # end

end
