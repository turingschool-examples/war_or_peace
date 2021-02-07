class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @card_array = []
    # puts Dir.pwd
  end

  def get_card_info(data)
    data[0].split(",").sort
  end

end
