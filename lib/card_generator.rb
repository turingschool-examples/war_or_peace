class CardGenerator
  attr_reader :filename,
              :array
  def initialize(filename)
    @filename = filename
    @array = []
  end

  def cards
    filename.each do |file|
      @array << file
    end
  end
end
