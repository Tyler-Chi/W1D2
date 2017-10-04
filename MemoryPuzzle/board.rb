require_relative 'card.rb'
require 'byebug'
# The Board is responsible for keeping track of all your Cards.
# You'll want a grid instance variable to contain Cards. Useful methods:
#
# #populate should fill the board with a set of shuffled Card pairs
# #render should print out a representation of the Board's current state
# #won? should return true if all cards have been revealed.

class Board
  NUMBER_OF_PAIRS = 2
  attr_accessor :grid

  def initialize(grid = populate)
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate
  #lets have the cards 1-10
    output_array = []
    (1..NUMBER_OF_PAIRS).each do |number|
      2.times { output_array << Card.new(number) }
    end

    arr = output_array.shuffle
    [
      arr[0...NUMBER_OF_PAIRS],
      arr[NUMBER_OF_PAIRS..-1]
    ]
  end

  def render
    system ('clear')
    displayed_array = [[],[]]
    @grid.each_with_index do |card_arr, index|
      card_arr.each do |card|
        displayed_array[index] << card.reveal
      end
    end

    p displayed_array[0]
    p displayed_array[1]
  end

  def won?
    @grid.flatten.none? { |card| card.card_status == false }
  end

  # #reveal should reveal a Card at guessed_pos (unless it's already face-up,
  # in which case the method should do nothing). It should also return
  #   the value of the card it revealed (you'll see why later).

  def reveal(position)
    if self[position].card_status == false
      self[position].card_status = true
      return self[position].card_value
    end
  end

end
