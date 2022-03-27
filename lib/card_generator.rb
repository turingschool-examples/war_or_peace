class CardGenerator

attr_reader :cards

  def initialize(file)
    @file = file
    @cards = []
  end

  def cards
    File.open("#{@file}").readlines
    file_data = File.readlines("#{@file}", chomp: true)

    file_data.each do |card|
    card_data = file_data.split(",")
    value = card_data[0]
    suit = card_data[1].to_sym
    rank = card_data[2].to_i
    end
  end

end
