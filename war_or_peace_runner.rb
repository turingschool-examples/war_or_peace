class Game
  def create_deck
# Create Hearts
    full_deck = []
    rank = 2
    9.times do
      value = rank.to_s
      full_deck << Card.new(:heart, value, rank)
      rank += 1
    end
    full_deck << Card.new(:heart, "Jack", 11)
    full_deck << Card.new(:heart, "Queen", 12)
    full_deck << Card.new(:heart, "King", 13)
    full_deck << Card.new(:heart, "Ace", 14)
# Create Spades
    rank = 2
    9.times do
      value = rank.to_s
    full_deck << Card.new(:spades, value, rank)
      rank += 1
    end
    full_deck << Card.new(:spades, "Jack", 11)
    full_deck << Card.new(:spades, "Queen", 12)
    full_deck << Card.new(:spades, "King", 13)
    full_deck << Card.new(:spades, "Ace", 14)
# Create Diamonds
    rank = 2
    9.times do
      value = rank.to_s
      full_deck << Card.new(:diamond, value, rank)
      rank += 1
    end
    full_deck << Card.new(:diamond, "Jack", 11)
    full_deck << Card.new(:diamond, "Queen", 12)
    full_deck << Card.new(:diamond, "King", 13)
    full_deck << Card.new(:diamond, "Ace", 14)
# Create Clubs
    rank = 2
    9.times do
      value = rank.to_s
      full_deck << Card.new(:clubs, value, rank)
      rank += 1
    end
    full_deck << Card.new(:clubs, "Jack", 11)
    full_deck << Card.new(:clubs, "Queen", 12)
    full_deck << Card.new(:clubs, "King", 13)
    full_deck << Card.new(:clubs, "Ace", 14)
  end

  def split_and_create_decks
    full_deck = create_deck
    shuffled_deck = full_deck.shuffle
    decks = [shuffled_deck[0..25], shuffled_deck[26..51]]
  end

  def create_players
    decks = split_and_create_decks
    deck1 = Deck.new(decks[0])
    deck2 = Deck.new(decks[1])
    [player1 = Player.new("Megan", deck1), player2 = Player.new("Aurora", deck2)]
  end

  def create_turn
    players = create_players
    player1 = create_players[0]
    player2 = create_players[1]
    Turn.new(player1, player2)
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    starter = gets.chomp.upcase
    if starter == "GO"
      turn = create_turn
      turn_num = 1
      while turn_num < 1000001 do
        if turn.type == :mutually_assured_destruction
          no_win = turn.winner
          cards = turn.pile_cards.size
          type = turn.type
          turn.award_spoils(winner)
          p "turn #{turn_num}: #{type} #{no_win}"
        else
          winner_name = turn.winner.name
          winner = turn.winner
          cards = turn.pile_cards.size
          type = turn.type
          turn.award_spoils(winner)
          p "turn #{turn_num}: #{type} #{winner_name} won #{cards} cards."
        end
        turn_num += 1
      end

    end
  end
end
