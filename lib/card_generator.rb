class CardGenerator

  def initialize(file)
    @file = file
  end

  def cards
    File.open("#{@file}").readlines
    file_data = File.readlines("#{@file}", chomp: true)
  end

end
