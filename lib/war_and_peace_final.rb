require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'
require 'pry'

class WarAndPeaceRunner

  attr_reader :player1, :player2, :card_values
  CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  def setup_cards
    all_cards.each_slice(26).to_a.shuffle #if all_cards
  end

  def create_decks
    setup_cards.map do |deck_of_cards|
      Deck.new(deck_of_cards)
    end
  end

  def all_cards
    arr = []
    cards_in_full_deck.each do |suit, arr_of_hash|
      arr_of_hash.each {|a| arr << Card.new(suit, a[:value], a[:rank]) }
    end
    arr
  end

  def cards_in_full_deck
    {
      :spade => arranging_rank_values(CARD_VALUES),
      :club => arranging_rank_values(CARD_VALUES),
      :heart => arranging_rank_values(CARD_VALUES),
      :diamond => arranging_rank_values(CARD_VALUES),
    }
  end

  def arranging_rank_values(card_values)
    card_values.map.with_index do |value, index|
      rank = index + 2
      {value: value, rank: rank}
    end
  end


  def start(player1, player2)
    puts "Welcome to War! (or Peace)"
    puts "This game will be played with 52 cards."
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
    puts "--" * 20
    # loop do
    #   case gets.chomp
    #   when 'GO'
    #     puts "Here we go!"
    #   else
    #     puts 'Enter "GO" to start the game!'
    #   end
    # end

    loop do
      turn = Turn.new(player1, player2)
      count = 1
      turn.pile_cards
      turn.winner
      turn.award_cards

      if turn.type == :basic
        puts "Turn #{count}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
      elsif turn.type == :war
        puts "Turn #{count}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
      elsif turn.type == :mutually_assured_destruction
        puts "Turn #{count}, *mutually assured destruction* 6 cards removed from play"
      end

      if player1.has_lost? == true
        puts "*~*~*~* #{player2.name} has won the game! *!*!*!*"
        break
      elsif player2.has_lost? == true
        puts "*~*~*~* #{player.name} has won the game! *!*!*!*"
        break
      elsif count == 1000000
        puts "---- DRAW ----"
        break
      end
      count += 1
    end
  end

end
