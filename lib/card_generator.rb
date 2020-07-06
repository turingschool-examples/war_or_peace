class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename = 'cards.txt')
    @filename = filename
    @cards = []
  end

  def file_lines
    arr = File.readlines(filename)
      arr.each do |line|
        @cards << line.strip
      end
  end

  require "pry"; binding.pry

end
