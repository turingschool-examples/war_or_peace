class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

# write tests for each class
# write readable code
# make frequent commits
# use pull requests

# rspec spec/card_spec.rb
# 

# percent_high_ranking: this method will return the percentage of cards that are high ranking
# remove_card: this method will remove the top card from the deck
# add_card: this method will add one card to the bottom (end) of the deck