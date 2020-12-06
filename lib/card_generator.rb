class CardGenerator
  attr_reader :filename,
              :array
  def initialize(filename)
    @filename = filename
    @array = []
  end

  def cards
    #left off here, couldn't get file to open :(
    file = File.open(@filename, 'r')
    file.map do |line|
      @array << line
    end
  end
end
