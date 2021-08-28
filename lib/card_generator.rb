class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    file = File.open(@filename)
    # creates an array of Strings by line
    file_data = file.readlines.map(&:chomp)
    file.close

    cards = []

    #iterate through each index
    file_data.each do |line|
      #split into array of 3 Strings
      card_data = line.split(', ')
      # create Card object
      cards << Card.new(card_data[1].downcase.to_sym, card_data[0], card_data[2].to_i)
    end

    return cards

  end

end
