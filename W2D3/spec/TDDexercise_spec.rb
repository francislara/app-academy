require "rspec"
require "TDDexercise.rb"

describe "#my_uniq" do
  it "returns unique elements in order in which they appear" do
    expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
  end
end

describe "#two_sum" do
  it "finds all pairs of positions where the elements at those positions sum to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "#my_transpose" do
  it "will convert between row-oriented and column-oriented representations" do
    expect([[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "#stock_picker" do
  it "takes an array of stock prices and outputs the most profitable pair of days to buy then the stock" do
    expect(stock_picker([5, 8, 2, 7])).to eq([3, 4])
  end
end

describe "#towers_of_hanoi" do
  subject(:game) { Game.new([[1, 2, 3], [], []]) }
  subject(:game_won) { Game.new([[], [1, 2, 3], []])}
  describe "#initialize" do
    it "will start with one filled rod, and two rods" do
      expect(game.board).to eq([[1, 2, 3], [], []])
    end
  end
  describe "#move" do
    it "will only move one disk at a time" do
      game.move(0, 1)
      expect(game.board[0].length).to eq(2)
    end

    it "will place a disk on the top of the stack" do
      game.move(0, 1)
      game.move(0, 2)
      game.move(1, 2)
      expect(game.board[2][0]).to eq(1)
    end

    it "will only take the top most disk" do
      game.move(0, 1)
      expect(game.board[0]).to_not include(1)
    end

    it "will only put disks of smaller size on to other disks" do
      game.move(0, 1)
      expect { game.move(0, 1) }.to raise_error("Invalid Move")
    end
  end
  describe "#won?" do
    it "will return true if the board is in a winning state" do
      expect(game_won.won?).to eq(true)
    end

    it "will return false if the board is not in a winning state" do
      expect(game.won?).to eq(false)
    end
  end
end
