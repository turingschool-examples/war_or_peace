require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class Init
  def display_start_message(player1, player2)
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
    puts '------------------------------------------------------------------'
  end

  

  def new_shuffled_deck
    card_values = Array(2..10).map { |num| [num.to_s, num] }

    card_values << ['Jack', 11]
    card_values << ['Queen', 12]
    card_values << ['King', 13]
    card_values << ['Ace', 14]

    suits = %i[diamond heart spade club]
    whole_deck = Deck.new([])

    card_values.each do |value|
      suits.each { |suit| whole_deck.add_card(Card.new(suit, value[0], value[1])) }
    end

    Deck.new(whole_deck.cards.shuffle)
  end

  def new_shuffled_deck_from_file
    Deck.new(CardGenerator.new.generate_cards('./lib/card_data.txt').shuffle)
  end

  def create_players(player1, player2)
    decks = deal_cards

    [Player.new(player1, decks[0]), Player.new(player2, decks[1])]
  end

  def deal_cards
    deck1 = Deck.new([])
    deck2 = Deck.new([])

    new_shuffled_deck_from_file.cards.each_with_index do |card, idx|
      case idx.even?
      when true
        deck1.add_card(card)
      when false
        deck2.add_card(card)
      end
    end

    [deck1, deck2]
  end

  def start
    players = create_players('Megan', 'Aurora')
    display_start_message(players[0], players[1])
    run(wait_for_go(players))
  end

  def wait_for_go(players)
    loop do
      return players if gets.chomp.upcase == 'GO'

      puts "Please enter 'GO' to continue"
    end
  end

  def run(players)
    someone_lost = false
    turn_number = 0
    until someone_lost
      turn_number += 1
      turn = Turn.new(players[0], players[1])

      winner = turn.winner
      turn.pile_cards
      card_amount = turn.spoils_of_war.length
      turn.award_spoils(winner)

      turn_description =
        case turn.type
        when :basic
          "#{winner.name} won #{card_amount} cards"
        when :loss
          someone_lost = true
          "#{(players.sort_by { |player| player.deck.cards.length })[0].name} did not have enough cards"
        when :war
          "WAR - #{winner.name} won #{card_amount} cards"
        when :mutually_assured_destruction
          "*mutually assured destruction* #{card_amount} cards removed from play"
        end

      puts "Turn #{turn_number}: " + turn_description

      break if someone_lost
      
      someone_lost = players[0].lost? || players[1].lost?
      break if turn_number >= 1_000_000
    end

    if someone_lost
      puts "*~*~*~* #{(players.sort_by { |player| player.deck.cards.length })[1].name} has won the game! *~*~*~*"

      return
    end

    puts '---- DRAW ----'
  end
end
