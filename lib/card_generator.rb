class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    deck = CSV.parse(File.read("filename"), headers: true)

    card_num = 0
    card_deck = []

    52.times do
      card = Card.new(deck[card_num]["suit"].to_sym, deck[card_num]["value"], deck[card_num]["rank"].to_i)
      card_deck << card
      card_num += 1
    end

    return card_deck

    # card0 = Card.new(deck[0]["suit"].to_sym, deck[0]["value"], deck[0]["rank"].to_i)
    # card1 = Card.new(deck[1]["suit"].to_sym, deck[1]["value"], deck[1]["rank"].to_i)
    # card2 = Card.new(deck[2]["suit"].to_sym, deck[2]["value"], deck[2]["rank"].to_i)
    # card3 = Card.new(deck[3]["suit"].to_sym, deck[3]["value"], deck[3]["rank"].to_i)
    # card4 = Card.new(deck[4]["suit"].to_sym, deck[4]["value"], deck[4]["rank"].to_i)
    # card5 = Card.new(deck[5]["suit"].to_sym, deck[5]["value"], deck[5]["rank"].to_i)
    # card6 = Card.new(deck[6]["suit"].to_sym, deck[6]["value"], deck[6]["rank"].to_i)
    # card7 = Card.new(deck[7]["suit"].to_sym, deck[7]["value"], deck[7]["rank"].to_i)
    # card8 = Card.new(deck[8]["suit"].to_sym, deck[8]["value"], deck[8]["rank"].to_i)
    # card9 = Card.new(deck[9]["suit"].to_sym, deck[9]["value"], deck[9]["rank"].to_i)
    # card10 = Card.new(deck[10]["suit"].to_sym, deck[10]["value"], deck[10]["rank"].to_i)
    # card11 = Card.new(deck[11]["suit"].to_sym, deck[11]["value"], deck[11]["rank"].to_i)
    # card12 = Card.new(deck[12]["suit"].to_sym, deck[12]["value"], deck[12]["rank"].to_i)
    # card13 = Card.new(deck[13]["suit"].to_sym, deck[13]["value"], deck[13]["rank"].to_i)
    # card14 = Card.new(deck[14]["suit"].to_sym, deck[14]["value"], deck[14]["rank"].to_i)
    # card15 = Card.new(deck[15]["suit"].to_sym, deck[15]["value"], deck[15]["rank"].to_i)
    # card16 = Card.new(deck[16]["suit"].to_sym, deck[16]["value"], deck[16]["rank"].to_i)
    # card17 = Card.new(deck[17]["suit"].to_sym, deck[17]["value"], deck[17]["rank"].to_i)
    # card18 = Card.new(deck[18]["suit"].to_sym, deck[18]["value"], deck[18]["rank"].to_i)
    # card19 = Card.new(deck[19]["suit"].to_sym, deck[19]["value"], deck[19]["rank"].to_i)
    # card20 = Card.new(deck[20]["suit"].to_sym, deck[20]["value"], deck[20]["rank"].to_i)
    # card21 = Card.new(deck[21]["suit"].to_sym, deck[21]["value"], deck[21]["rank"].to_i)
    # card22 = Card.new(deck[22]["suit"].to_sym, deck[22]["value"], deck[22]["rank"].to_i)
    # card23 = Card.new(deck[23]["suit"].to_sym, deck[23]["value"], deck[23]["rank"].to_i)
    # card24 = Card.new(deck[24]["suit"].to_sym, deck[24]["value"], deck[24]["rank"].to_i)
    # card23 = Card.new(deck[23]["suit"].to_sym, deck[23]["value"], deck[23]["rank"].to_i)
    # card24 = Card.new(deck[24]["suit"].to_sym, deck[24]["value"], deck[24]["rank"].to_i)
    # card25 = Card.new(deck[25]["suit"].to_sym, deck[25]["value"], deck[25]["rank"].to_i)
    # card26 = Card.new(deck[26]["suit"].to_sym, deck[26]["value"], deck[26]["rank"].to_i)
    # card27 = Card.new(deck[27]["suit"].to_sym, deck[27]["value"], deck[27]["rank"].to_i)
    # card28 = Card.new(deck[28]["suit"].to_sym, deck[28]["value"], deck[28]["rank"].to_i)
    # card29 = Card.new(deck[29]["suit"].to_sym, deck[29]["value"], deck[29]["rank"].to_i)
    # card30 = Card.new(deck[30]["suit"].to_sym, deck[30]["value"], deck[30]["rank"].to_i)
    # card31 = Card.new(deck[31]["suit"].to_sym, deck[31]["value"], deck[31]["rank"].to_i)
    # card32 = Card.new(deck[32]["suit"].to_sym, deck[32]["value"], deck[32]["rank"].to_i)
    # card33 = Card.new(deck[33]["suit"].to_sym, deck[33]["value"], deck[33]["rank"].to_i)
    # card34 = Card.new(deck[34]["suit"].to_sym, deck[34]["value"], deck[34]["rank"].to_i)
    # card35 = Card.new(deck[35]["suit"].to_sym, deck[35]["value"], deck[35]["rank"].to_i)
    # card36 = Card.new(deck[36]["suit"].to_sym, deck[36]["value"], deck[36]["rank"].to_i)
    # card37 = Card.new(deck[37]["suit"].to_sym, deck[37]["value"], deck[37]["rank"].to_i)
    # card38 = Card.new(deck[38]["suit"].to_sym, deck[38]["value"], deck[38]["rank"].to_i)
    # card39 = Card.new(deck[39]["suit"].to_sym, deck[39]["value"], deck[39]["rank"].to_i)
    # card40 = Card.new(deck[40]["suit"].to_sym, deck[40]["value"], deck[40]["rank"].to_i)
    # card41 = Card.new(deck[41]["suit"].to_sym, deck[41]["value"], deck[41]["rank"].to_i)
    # card42 = Card.new(deck[42]["suit"].to_sym, deck[42]["value"], deck[42]["rank"].to_i)
    # card43 = Card.new(deck[43]["suit"].to_sym, deck[43]["value"], deck[43]["rank"].to_i)
    # card44 = Card.new(deck[44]["suit"].to_sym, deck[44]["value"], deck[44]["rank"].to_i)
    # card45 = Card.new(deck[45]["suit"].to_sym, deck[45]["value"], deck[45]["rank"].to_i)
    # card46 = Card.new(deck[46]["suit"].to_sym, deck[46]["value"], deck[46]["rank"].to_i)
    # card47 = Card.new(deck[47]["suit"].to_sym, deck[47]["value"], deck[47]["rank"].to_i)
    # card48 = Card.new(deck[48]["suit"].to_sym, deck[48]["value"], deck[48]["rank"].to_i)
    # card49 = Card.new(deck[49]["suit"].to_sym, deck[49]["value"], deck[49]["rank"].to_i)
    # card50 = Card.new(deck[50]["suit"].to_sym, deck[50]["value"], deck[50]["rank"].to_i)
    # card51 = Card.new(deck[51]["suit"].to_sym, deck[51]["value"], deck[51]["rank"].to_i)
    #
    # card_deck = [card0,card1,card2,card3,card4,card5,card6,card7,card8,card9,card10,card11,card12,card13,card14,card15,card16,card17,card18,card19,card20,card21,card22,card23,card24,card25,card26,card27,card28,card29,card30,card31,card32,card33,card34,card35,card36,card37,card38,card39,card40,card41,card42,card43,card44,card45,card46,card47,card48,card49,card50,card51]
  end
end
