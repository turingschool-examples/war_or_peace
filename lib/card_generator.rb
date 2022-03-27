class CardGenerator

  def initialize(file)
    @file = file
  end

  def cards
    File.open("#{@file}").readlines
    File.readlines("#{@file}", chomp: true)
  end

end
