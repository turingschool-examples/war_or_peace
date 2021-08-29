class Play

  attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    turn_count = 1
    while turn_count <= 1000001
      if @player_1.deck.cards.length == 0 || @player_2.deck.cards.length == 0
        if @player_1.deck.cards.length == 0
          p "#{@player_1.name} is the winner!"
          break
        else
          p "#{@player_2.name} is the winner!"
          break
        end
      elsif turn_count == 1000000
        p "The game has ended in a draw."
        break
      else
        while turn_count <= 1000000
          break if @player_1.deck.cards.length == 0 || @player_2.deck.cards.length == 0
          turn = Turn.new(@player_1, @player_2)
          turn.pile_cards
          turn.award_spoils
          break if @player_1.deck.cards.length == 0 || @player_2.deck.cards.length == 0
          p "#{@player_1.name} has #{@player_1.deck.cards.length} cards."
          p "#{@player_2.name} has #{@player_2.deck.cards.length} cards."
          p "The turn count is #{turn_count}"
          turn_count += 1
        end
      end
    end
  end

end
