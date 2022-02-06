#card_generator.#!/usr/bin/env ruby -wKU
require './lib/card'
require 'CSV'

class CardGenerator

  attr_reader :filename
  def initialize (filename)
    @filename = filename
    @cards = []
  end

  def cards
  #  puts File.read(@filename)
      linenum = 0
     File.foreach( @filename ) do |line|
       linenum = linenum + 1

#      puts "#{linenum}"
       mkcard = CSV.parse(line)
#       binding.pry
#      puts "suit #{mkcard[0][1]} value #{mkcard[0][0]} rank #{mkcard[0][2]}"
      card = (Card.new( mkcard[0][1], mkcard[0][0], (mkcard[0][2]).to_i ))
      @cards.push(card)
#      binding.pry
    end
    return @cards

  end

end
