def start
  turn_count = 0

  until player1.has_lost? == true || player2.has_lost? == true || turn_count == 1000000
    turn_count += 1
    turn.award_spoils
    if @turn = :basic
      p "Turn #{turn_count}: #{winner.name} won 2 cards"
    elsif @turn = :war
      p "Turn #{turn_count}: #{winner.name} won 6 cards"
    else @turn = :war
      p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
    end
end
