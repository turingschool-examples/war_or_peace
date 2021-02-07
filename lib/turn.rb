class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = type
  end

  def type
    end_the_war if player1.deck.cards.size < 3 || player2.deck.cards.size < 3
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if @type == :mutually_assured_destruction
      "No Winner"
      # require "pry"; binding.pry
    elsif @type == :basic
      who_won(0)
    else
      who_won(2)
    end
    # p "#{@type} winner end" BREAK
  end

  def who_won(index)
    if player1.deck.rank_of_card_at(index) > player2.deck.rank_of_card_at(index)
      player1
    else
      player2
    end
  end

  def pile_cards
    # p "#{@type} pile"
    if @type == :basic
      @spoils_of_war << player1.lose_card
      @spoils_of_war << player2.lose_card
    elsif @type == :war
      3.times {@spoils_of_war << player1.lose_card}
      3.times {@spoils_of_war << player2.lose_card}
    else @type == :mutually_assured_destruction
      #XX require "pry"; binding.pry
      3.times {player1.lose_card; player2.lose_card}
    end
    p "#{@type} pile end"
  end

  def award_spoils(winner)
    # p "#{winner} spoils"
    if @type == :mutually_assured_destruction
    else
      @spoils_of_war.each {|spoil| winner.deck.add_card(spoil)}
    end
    p "#{@type} spoils end"
  end

  def start_a_war     #Done in GAME
    line = 1
    result = nil
    # require "pry"; binding.pry
    until player1.deck.cards.size == 4 || player2.deck.cards.size == 4
    # until player1.has_lost? == true || player2.has_lost? == true
      turn = Turn.new(player1, player2)
      turn.type # result = turn.type
      p @type
      # if result == :mutually_assured_destruction
      #   # require "pry"; binding.pry
      #   victor = "No Winner"
      # else
        victor = turn.winner
      # end
      turn.pile_cards
      # require "pry"; binding.pry
      turn.award_spoils(victor)
      if result == :mutually_assured_destruction
        p "Turn #{line}: *mutually assured destruction* 6 cards removed from play"
        #XX require "pry"; binding.pry
      elsif result == :war
        p "Turn #{line}: WAR - #{victor.name} won 6 cards"
      else
        p "Turn #{line}: #{victor.name} won 2 cards"
      end
      p player1.deck.cards.size
      p player2.deck.cards.size
      line +=1
      break if line == 1000001
    end
    end_the_war
  end

  def end_the_war
    if player1.has_lost? == true || player2.has_lost? == true #turn..
        p "*~*~*~* #{victor.name} has won the game! *~*~*~*"
    else
        p "---- DRAW ----"
    end
  end
end
