require './lib/card'

class CardGenerator

  attr_accessor :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  # Need to find something that can open the file
  # THEN, it should read the first line, convert it to an array element
  # THEN, add into array
  # there is a class file
  # You can open by file = File.open("filename")
  # Read method 1 - .read
  # method 1 hints - .split OR .readlines and .chomp
  # Seems like best method
  # Rubyguides.com example uses enumerator .map
  def read_generator
    file = File.open("./lib/deck_of_cards.txt")
    file_data = file.readlines.map(&:chomp)
    file.close
    file_data
  end
end
