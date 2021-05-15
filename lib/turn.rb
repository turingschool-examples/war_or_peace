class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type

      if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      else
        :basic
      end
  end

  def winner
    if type == :basic #(self.type??)
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
        "No Winner"
    else
      puts "Game Over"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}
    elsif type == :mutually_assured_destruction
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
    else
      puts "Game Over"
    end
  end

  def award_spoils(winner)
    @spoils_of_war.map do |card|
      winner.deck.cards << card

      #winner.deck.add_card(card)
    end
  end

# #Start
# p 'Welcome to War! (or Peace) This game will be played with 52 cards.
# The players today are Megan and Aurora.
# Type 'GO' to start the game!
# ------------------------------------------------------------------'
  # class Game
  #   attr_reader :full_deck, :deck1, :deck2, :player1, :player2
  #
  #   def start
  #     p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
  #     p 'The players today are Megan and Aurora.'
  #     p 'Type 'GO' to start the game!'
  #     'p ------------------------------------------------------------------'
  #     input = gets.chomp.upcase
  #     shuffle_deck
  #     split_deck
  #     add_deck_to_players
  #     turns
  #   end
  #
  #
  #   def shuffle_deck
  #     :full_deck.shuffle!()
  #   end
  #
  #   def split_deck
  #     full_deck.shuffle_deck.slice(26)
  #
  #     #this method will split the deck between two players
  #   end
  #
  #   def add_deck_to_players
  #     #This adds both players to the game
  #   end
  #
  #   def turns
  #     #this method will keep count and return the the number of turns
  #   end
  # end
  #
  #
  #
  #
  #
  #
  #

end
