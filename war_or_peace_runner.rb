require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'
require './lib/engine'

def create_full_deck
  values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
  ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  values_and_ranks = values.zip(ranks)
  full_deck = []
  values_and_ranks.map do |x|
    full_deck << [x, :diamond].flatten
    full_deck << [x, :heart].flatten
    full_deck << [x, :spade].flatten
    full_deck << [x, :club].flatten
  end

  full_deck = full_deck.map do |x|
    Card.new(x[2], x[0], x[1])
  end
end

all_cards = create_full_deck
all_cards.shuffle!

deck1 = Deck.new(all_cards.slice!(0, 26))
deck2 = Deck.new(all_cards)

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

game = Engine.new

game.start(player1, player2)

counter = 1

until player1.has_lost? || player2.has_lost? || counter == 1_000_000
  turn = Turn.new(player1, player2)
  if turn.type == :war && player1.deck.cards.count >= 3 && player2.deck.cards.count >= 3
    case turn.type
    when :mutually_assured_destruction
      turn.pile_cards
      puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
    when :war
      if player1.deck.cards.count > 3 && player2.deck.cards.count > 3
        turn.pile_cards
        turn.award_spoils(turn.winner)
        puts "Turn #{counter}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
      elsif player1.deck.cards.count < 3 || player2.deck.cards.count < 3
        if player1.deck.cards.count < 3
          player2.deck.cards.concat(player1.deck.cards)
          player1.deck = []
          break
        elsif player2.deck.cards.count < 3
          player1.deck.cards.concat(player2.deck.cards)
          player2.deck = []
          break
        end
        break
      end
    when :basic
      turn.pile_cards
      break if player1.deck.cards.length == 0 || player2.deck.cards.length == 0

      if turn.winner != 'No Winner' && turn.winner != 'something fishy'
        turn.award_spoils(turn.winner)
        puts "Turn #{counter}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
        puts "#{player1.name} has #{player1.deck.cards.count} cards"
        puts "#{player2.name} has #{player2.deck.cards.count} cards"
      elsif turn.winner == 'No Winner'
        turn.winner

      elsif turn.winner == 'something fishy'
        break

      end
    else
      'error in turn.type case statement'
    end
  elsif turn.type == :basic && player1.deck.cards.count >= 3 && player2.deck.cards.count >= 3
    case turn.type
    when :mutually_assured_destruction
      turn.pile_cards
      puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
    when :war
      if player1.deck.cards.count > 3 && player2.deck.cards.count > 3
        turn.pile_cards
        turn.award_spoils(turn.winner)
        puts "Turn #{counter}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
      elsif player1.deck.cards.count < 3 || player2.deck.cards.count < 3
        if player1.deck.cards.count < 3
          player2.deck.cards.concat(player1.deck.cards)
          player1.deck = []
          break
        elsif player2.deck.cards.count < 3
          player1.deck.cards.concat(player2.deck.cards)
          player2.deck = []
          break
        end
        break
      end
    when :basic
      turn.pile_cards
      break if player1.deck.cards.length == 0 || player2.deck.cards.length == 0

      if turn.winner != 'No Winner' && turn.winner != 'something fishy'
        turn.award_spoils(turn.winner)
        puts "Turn #{counter}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
        puts "#{player1.name} has #{player1.deck.cards.count} cards"
        puts "#{player2.name} has #{player2.deck.cards.count} cards"
      elsif turn.winner == 'No Winner'
        turn.winner

      elsif turn.winner == 'something fishy'
        break

      end
    else
      'error in turn.type case statement'
    end
  elsif turn.type == :mutually_assured_destruction && player1.deck.cards.count >= 3 && player2.deck.cards.count >=3
    case turn.type
    when :mutually_assured_destruction
      turn.pile_cards
      puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
    when :war
      if player1.deck.cards.count > 3 && player2.deck.cards.count > 3
        turn.pile_cards
        turn.award_spoils(turn.winner)
        puts "Turn #{counter}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
      elsif player1.deck.cards.count < 3 || player2.deck.cards.count < 3
        if player1.deck.cards.count < 3
          player2.deck.cards.concat(player1.deck.cards)
          player1.deck = []
          break
        elsif player2.deck.cards.count < 3
          player1.deck.cards.concat(player2.deck.cards)
          player2.deck = []
          break
        end
        break
      end
    when :basic
      turn.pile_cards
      break if player1.deck.cards.length == 0 || player2.deck.cards.length == 0

      if turn.winner != 'No Winner' && turn.winner != 'something fishy'
        turn.award_spoils(turn.winner)
        puts "Turn #{counter}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
        puts "#{player1.name} has #{player1.deck.cards.count} cards"
        puts "#{player2.name} has #{player2.deck.cards.count} cards"
      elsif turn.winner == 'No Winner'
        turn.winner

      elsif turn.winner == 'something fishy'
        break

      end
    else
      'error in turn.type case statement'
    end
  else
    puts 'edge case'
    break
  end

  counter += 1
end

if player1.has_lost?
  puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
elsif player2.has_lost?
  puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
elsif counter == 1_000_000
  puts '---- DRAW ----'
end


