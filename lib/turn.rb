class Turn
  @@turn_count = 0
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type,
              :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = set_type
    @winner = set_winner
    @@turn_count += 1
  end

  def self.turn_count
    @@turn_count
  end

  def set_type
    if player1.deck.cards.length < 3 || player2.deck.cards.length < 3
      :loss
    elsif mutually_assured_destruction?
      :mutually_assured_destruction
    elsif war?
      :war 
    elsif basic?
      :basic
    end
  end

  def basic?
    @player1.deck.rank_of_card_at(0) !=
    @player2.deck.rank_of_card_at(0)
  end
  
  def war?
    @player1.deck.rank_of_card_at(0) == 
    @player2.deck.rank_of_card_at(0)
  end
  
  def mutually_assured_destruction?
    @player1.deck.rank_of_card_at(0) ==
    @player2.deck.rank_of_card_at(0) &&
    @player1.deck.rank_of_card_at(2) ==
    @player2.deck.rank_of_card_at(2)
  end
  
  def set_winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else 
        @player2
      end
    elsif type == :mutually_assured_destruction 
       p "No Winner"
    elsif type == :loss 
      if player1.deck.cards.length < 3
        @player2 
      elsif player2.deck.cards.length < 3
        @player1
      end
    end
  end


  def pile_cards
    if type == :mutually_assured_destruction && winner == "No Winner"
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
      end
    elsif type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    else
      2.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    unless :mutually_assured_destruction == type 
      @spoils_of_war.each do |card|
        winner.deck.add_card(card)
      end
    end
  end

  def turn_result
    if type == :basic
      puts "Turn #{@@turn_count}: #{winner.name} won #{spoils_of_war.length} cards"
    elsif type == :war 
      puts "Turn #{@@turn_count}: WAR - #{winner.name} won #{spoils_of_war.length} cards"
    elsif type == :mutually_assured_destruction
      puts "Turn #{@@turn_count}: *mutually assured destruction* 6 cards removed from play"
    else
      puts "Player has run out of cards!"
    end
  end

  def end_result
    if @@turn_count == 1_000_000
      puts "--- Draw ---"
    else
      puts "*~*~*~* #{winner.name} has won the game! *~*~*~*"
    end
  end
end