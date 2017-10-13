class Card

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def ==(card)
    return true if self.value == card.value && self.suit == card.suit
    false
  end

  # def !=(card)
  #   return true if self.value != card.value || self.suit != card.suit
  #   false
  # end

end
