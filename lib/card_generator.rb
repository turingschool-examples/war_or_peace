class CardGenerator
    attr_reader :file

    def initialize(filename)
        @file = File.open(filename)
        @file_data = []
    end

    def read_file
        @file_data = @file.read
        @file_data = @file_data.split("\n")
        @file_data
    end

    def cards
        read_file
        card_array = []
        card_inst = []
        @file_data.each do |i|
            card_array << i.split(", ")
        end
        card_array.each do |s, v, r|
            card_inst << Card.new(s.to_sym, v.to_s, r)
        end
        return card_inst
    end
end