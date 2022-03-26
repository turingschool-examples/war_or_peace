require './lib/card'
class CardGenerator
  attr_reader :card_file

  def initialize(card_file)
  @card_file = card_file
  end
  # file = File.open(file_name, "r")

  def cards
    path = File.join(File.dirname(__FILE__), @card_file)
    file = File.open(path, "r")
    data = file.read
    card_array = Array.new
    temp_array = []
    data.each_line do |line|
      temp_array << line.chomp.split(",")
      add_card = Card.new(temp_array[-1][1].chomp,temp_array[-1][0].chomp,temp_array[-1][2].chomp.to_i)
      card_array << add_card
    end
    return card_array
  end
end
