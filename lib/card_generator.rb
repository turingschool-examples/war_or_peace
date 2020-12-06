
class CardGenerator
  attr_reader :filename
  def initialize(filename)
    @file_name = filename
  end

  def read_files
    # @filename = File.new "cards.txt"
    # @filename = File.open("cards.txt", "r")
  end
end
