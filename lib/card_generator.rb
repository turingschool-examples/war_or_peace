# I did not write tests for this but I worked it out on paper first

require './lib/card'

class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
    do_the_thing
  end

  def do_the_thing
    p_arr = File.readlines(@filename).map do |line|
      it = clean(line)
      v = it[0]
      s = it[1].downcase.lstrip.to_sym
      r = it[2].to_i
      {suit: s, value: v, rank: r}
    end

    p_arr.length.times do |i|
      @cards << Card.new(p_arr[i][:suit], p_arr[i][:value], p_arr[i][:rank])
    end
  end

  def clean(line)
    it = line.to_s
    it = line.split(",")
  end

end
