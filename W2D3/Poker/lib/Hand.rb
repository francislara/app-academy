require_relative "Card.rb"
require_relative "Deck.rb"
require_relative "Game.rb"
require_relative "Hand.rb"
require_relative "Player.rb"


class Hand

attr_reader :cards

  def initialize
    @cards = []
  end


end
