require 'json'

class CardGenerator
  attr_reader :cards
  def initialize(cards = nil)
    @cards = cards
  end

  def run
    card_inputs = []
    suits = [:spade, :heart, :diamond, :club]
    values_ranks = [['Ace', 14], ['King', 13], ['Queen', 12], ['Jack', 11], 
                    ['Ten', 10], ['Nine', 9], ['Eight', 8], ['Seven', 7], ['Six', 6], 
                    ['Five', 5], ['Four', 4], ['Three', 3], ['Two', 2]]
    values_ranks.each do |card|
      card_inputs << [suits[0], card].flatten
      card_inputs << [suits[1], card].flatten
      card_inputs << [suits[2], card].flatten
      card_inputs << [suits[3], card].flatten
    end
    @cards = card_inputs.map do |input|
      Card.new(input[0], input[1], input[2])
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def write
    File.open('cards.txt', "w") do |file|
      file.write(@cards.to_json)
    end
  end

  def to_array
    @cards << JSON.parse(File.read('cards.txt'))
    @cards.delete_at(-1)
  end
end

