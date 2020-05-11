class Build
  attr_reader :proto_arr

  def initialize
    @proto_arr = []
    start
  end

  def start
    values = (2..10).to_a

    values = values.map do |value|
      value.to_s
    end

    faces = ["Jack", "Queen", "King", "Ace"]
    faces.each do |face|
      values << face
    end

    suits = [:club, :spade, :heart, :diamond]

    suits.each do |suit|
      values.each.with_index(2) do |value, i|
        @proto_arr << {"suit" => suit, "value" => value, "rank" => i}
      end
    end

    @proto_arr.shuffle!
  end

end
