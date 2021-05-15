
  @deck = []
  suits = ["spades", "diamonds", "hearts", "clubs"]
  ranks = {"A" => 14 ,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13
  }

  suits.each do |suit|
    ranks.each do |value,rank|
      card = Card.new(suit, value, rank)
      @deck << card
    end
  end

  @deck.shuffle!
  deck1 = @deck[0..25]
  deck2 = @deck[26..51]
