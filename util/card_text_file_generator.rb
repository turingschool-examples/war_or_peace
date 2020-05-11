class CardTextFileGenerator
  attr_reader :suits,
              :i,
              :royal,
              :numbers,
              :pecking_order,
              :style,
              :deck

  def initialize(i)
    @i = i #gets.chomp
    @suits = []
    @royal = ["Jack", "Queen", "King"]
    @numbers = str_arr
    @pecking_order = nil
    @style = nil
    @shuffled = false
    @deck = []
  end

  def write_it
    File.open("#{"shuffled_" if @shuffled}#{@style.downcase}_deck#{"s" if @i > 1}.txt", "w") do |file|
      @deck.each do |d_elem|
        file.puts("#{d_elem}".gsub(/[\[\]\"]/, ""))
      end
    end
  end

  def standardize
    @suits = standard_suits
    @pecking_order = standard_order
    @style = "Standardized"
  end

  def standard_suits
    [:club, :spade, :heart, :diamond]
  end

  def tarotize
    @suits = tarot_suits
    @royal.unshift "Knight"
    @pecking_order = tarot_order
    @style = "Tarotized"
  end

  def tarot_suits
    [:cup, :wand, :coin, :sword]
  end

  def aces_high?
    @suits == standard_suits
  end

  def ace
    ["Ace"]
  end

  def str_arr
    (2..10).to_a.map { |num| num.to_s }
  end

  def standard_order
    [numbers, royal, ace].flatten!
  end

  def tarot_order
    [ace, numbers, royal].flatten!
  end

  def deck_size
    @pecking_order.size * @suits.size
  end

  def cards_to_print
    @i * deck_size
  end

  def shuffled?
    @shuffled
  end

  def generate_deck
    d_arr = Array.new

    n = 2 if style == "Standardized"
    n = 1 if style == "Tarotized"

    @i.times do
      suits.each do |suit|
        pecking_order.each.with_index(n) do |peck, n|
          d_arr << [peck, suit.capitalize.to_s, n.to_s]
        end
      end
    end

    d_arr.shuffle! if shuffled?

    @deck = d_arr
  end

  def shuffle
    @shuffled = true
  end

end

# Example interaction pattern for standard deck

# deck_stan = CardTextFileGenerator.new(2)
# deck_stan.standardize
# deck_stan.generate_deck
# deck_stan.write_it
### this will create a new text file!
# it will have two, ordered decks

# Example interaction pattern for tarot deck

# deck_taro = CardTextFileGenerator.new(1)
# deck_taro.tarotize
# deck_taro.shuffle # optional
# deck_taro.generate_deck
# deck_taro.write_it
### this will create a new text file!
# it will have one shuffled tarot deck
