class CardGenerator
  attr_reader :suits,
              :ranks,
              :full_card_deck

  def initialize(suits, ranks)
    @suits = suits
    @ranks = ranks
    @full_card_deck = []
  end
end
