
def deck_generator
  card_suit = %i[heart club diamond spade]
  card_rank = {:two => 2, :three => 3, :four => 4, :five => 5, :six => 6, :seven =>7, :eight =>8, :nine => 9, :ten => 10, :jack =>11, :queen => 12, :king => 13, :ace => 14}
  card_rank.map do |k,v|
    card_suit.map do |suit|
      @deck << Card.new( suit, k,v )
    end
  end
end
