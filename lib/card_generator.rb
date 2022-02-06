#card_generator.#!/usr/bin/env ruby -wKU
require './lib/card'

class CardGenerator

  attr_reader :filename
  def initialize (filename)
    @filename = filename
    @cards = []
  end

  def cards
  #  puts File.read(@filename)
    File.foreach( 'filename' ) do |line|
      puts line

  end


end
