require_relative 'Card'

VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K).freeze
SUITS = %w(Hearts Clubs Diamonds Spades).freeze

class Deck

  attr_reader :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |val|
        @cards << Card.new(val, suit)
      end
    end
    shuffle
  end

  def shuffle
    @cards.shuffle
    @cards
  end
end
