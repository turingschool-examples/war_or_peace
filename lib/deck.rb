class Deck
  def initialize
    @faces = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
    @suits = [:diamond, :club, :heart, :spade]
    @cards = []
  end

  @faces.each do |face|
    if face.class == Integer
      value = face
    elsif face.class == 'Jack'
      value = 11
    elsif face.class == 'Queen'
      value = 12
    elsif face.class == 'King'
      value = 13
    elsif face.class == 'Ace'
      value = 14
  end
end
