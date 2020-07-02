class StandardDeck
 attr_reader  :ranks,
              :values,
              :suits
  def initialize(all_cards_info)
    @ranks = all_cards_info["ranks"]
    @values = all_cards_info["values"]
    @suits = all_cards_info["suits"]
  end

  # def group_by_suits(suits, values, ranks)
  #
  # end

end
