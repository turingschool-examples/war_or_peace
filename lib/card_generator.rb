require 'pry'
require 'card'


# class CardGenerator
#     attr_reader :file_path, :file 
#     #check out replacing file_path by using ARGV[1] (adds cards.txt to command line)
#     def initialize(file)
#         # @file = File.open(file_path, 'r')
#         @file = file 
#         # binding.pry 
#     end 
    
# end 

#card_gen = CardGenerator.new(ARGV[0])


class CardGenerator
    attr_reader :file_path, :file, :card_arguments, :cards
    #check out replacing file_path by using ARGV[1] (adds cards.txt to command line)
    def initialize
        @file_path = File.join(File.dirname(__FILE__), 'cards.txt')
        @file = File.open(file_path, 'r')
        @card_arguments = []
        @cards = []
    end 

    def generate_array
        @card_arguments = @file.map do |line|
             card = line.split(',').map { |item| item.strip }
             card[2] = card[2].to_i
             card
        end
        @card_arguments
    end 

    def generate_deck
        generate_array
        @card_arguments.each do |card|
            @cards << Card.new(card[1],card[0],card[2])
        end 
    end 
end 


# path = File.join(File.dirname(__FILE__), 'cards.txt')
#         cards = File.open(path, 'r').map do |line|
#             args = line.split(',').map { |item| item.strip }
#             args[2] = args[2].to_i
#             args