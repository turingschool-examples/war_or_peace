require 'pry'
require './lib/card'

class CardGenerator
    attr_reader :file, :cards
    def initialize(filename)
        @file = File.open("lib/#{filename}")
        @cards = generate_deck
    end 

    def generate_deck
        cards = []
        @file.each do |line|
             card = line.split(',').map { |item| item.strip }
             card[2] = card[2].to_i
             cards << Card.new(card[1],card[0],card[2])
        end
        cards
    end 
end 