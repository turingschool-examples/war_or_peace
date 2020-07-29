class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner, :turn_type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = nil
    @turn_type = nil
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      @turn_type = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) # && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      @turn_type = :war
    else
      @turn_type = :basic
    end
  end

  def winner?
    self.type
    if @turn_type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
        "player1"
      else
        @winner = @player2
        "player2"
      end
    elsif @turn_type == :war
      if @player2.deck.cards.length > 2 && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
        "player1"
      else
        @winner = @player2
        "player2"
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    self.type
    if @turn_type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif @turn_type == :war
      3.times  do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
      # 3.times {@spoils_of_war << @player2.deck.remove_card}
    else
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(recipient)
    @spoils_of_war.shuffle.each {|card| recipient.deck.add_card(card)}
    @spoils_of_war.clear
  end

  def start
    # puts "Welcome to War! (Or Peace) This game will be played with #{@player1.deck.cards.length + @player2.deck.cards.length} cards."
    # puts "The players today are #{@player1.name} and #{@player2.name}."
    # puts "Type GO to start the game!"
    # puts "--------------------------------------------"
    input = gets.chomp
    if input.upcase == "GO"
      # turn_counter = 0
      # until self.player1.has_lost == true || self.player2.has_lost == true do
      #   turn_counter += 1
      #   self.winner?
      #   self.pile_cards
      #   puts "Turn #{turn_counter}: #{self.turn_type} - #{self.winner.name} won #{self.spoils_of_war.length} cards."
      #   self.award_spoils(self.winner)
      #   puts "#{self.player1.name} has #{self.player1.deck.cards.length} cards in their deck"
      #   puts "#{self.player2.name} has #{self.player2.deck.cards.length} cards in their deck"
      #
      #   self.player1.has_lost?
      #   self.player2.has_lost?
      #
      #   break if turn_counter == 1000000
      # end
      puts "Let's begin the battle!"
    else
      abort "Okay, bye!"
    end
  end

end
