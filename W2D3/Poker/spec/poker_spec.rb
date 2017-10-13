require "rspec"
require "Card.rb"
require "Deck.rb"
require "Game.rb"
require "Hand.rb"
require "Player.rb"


describe Card do
  subject(:card) { Card.new("10", "Diamonds") }
  describe "#initialize" do
    it "is given a value" do
      expect(card.value).to eq("10")
    end
    it "is given a suit" do
      expect(card.suit).to eq("Diamonds")
    end
  end
  describe "#==" do
    it "compares 2 cards" do
      expect(card == Card.new("10", "Diamonds")).to eq(true)
      expect(card == Card.new("A", "Spades")).to eq(false)
    end
  end
end

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "starts with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
    it "starts shuffled" do
      expect(deck.cards.sort[0]).to_not eq(deck.cards[0])
    end
  end
  describe "#shuffle" do
    it "can be shuffled" do
      expect(deck.shuffle[0]).to_not eq(deck.cards[0])
      expect(deck.shuffle[0]).to eq(deck.cards.sort[0])
    end
  end
end

describe Hand do
  subject(:hand) {Hand.new}
  describe "#initialize" do
    it "begins with an empty hand" do
      expect(hand.cards.length).to eq(0)
    end
  end

  describe "full_hand" do
    # full_hand = double("dummy_full_hand", :hand => [Card.new("2", "Diamonds"), Card.new("2", "Diamonds"), Card.new("3", "Spades"), Card.new("4", "Hearts"), Card.new("8", "Clubs")] )
    it "finds a pair when two cards in the hand are the same" do
      expect(hand.sort.value)
  end
end

describe Player do
  subject(:player) { Player.new("Jimbo Slice", Hand.new, 10000) }
  describe "initialize" do
    it "gives each player a hand and some cash money" do
      expect(player.hand).to_not be_nil
    end

    it "gives each player some cash money" do
      expect(player.cash_money).to_not eq(0)
    end
  end
  describe "#discard?" do
    let(:user_input) { "Y" }
    it "prompts the player to discard cards" do
      expect(player.discard?(:user_input)).to eq(true)
    end
  end


end



  # describe Game do
  #   subject(:game) { Game.new(players) }
  #   describe "#deal_cards" do
  #     it "should deal five cards to each player" do
  #      game.deal_cards
  #     expect(Player.hand_size).to eq(5)
  #     end
  #   end
  # end

end
