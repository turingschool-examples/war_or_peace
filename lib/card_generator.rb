# require './lib/cards.txt'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    File.readlines(@filename).each do |line|
      require 'pry'; binding.pry
      puts line
    end
  end
end
