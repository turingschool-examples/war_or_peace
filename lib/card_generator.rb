class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    file = File.open("users.txt")
  end

end
