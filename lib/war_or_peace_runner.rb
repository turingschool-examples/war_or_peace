

suits = [:heart, :diamond, :spade, :club]
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1]

cards = []
suits.each do |suit|
  values.each do |value|
    cards << {suits: suit, values: value, ranks: ranks[values.find_index(value)]}
  end

end

# puts cards 
# puts values.find_index('3')
two_decks = []
two_decks = cards.shuffle.each_slice(26).to_a
deck1 = two_decks[0]
deck2 = two_decks[1]

puts deck1[0] 


