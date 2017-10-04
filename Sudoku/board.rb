require_relative 'tile'

class Board

  attr_reader :grid

  def initialize
    @grid = from_file
  end

  def from_file
    rows = File.readlines("sudoku1.txt").map(&:chomp)

    outputarray = Array.new(9) {Array.new(0)}
    rows.each_with_index do |row,index|
      row.split("").map(&:to_i).each do |num|
        outputarray[index] << Tile.new(num)
      end
    end
    return outputarray

  end

  def [](pos)
    row, col = pos
    @grid[row][col].value
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col].change_value(value)
  end



  def solved?
    #check rows
    (0..8).each do |row|
      current_row = @grid[row][0..8]
      value_arr = []
      current_row.each do |tile|
        value_arr << tile.value
      end
      return false unless (value_arr == value_arr.uniq && !value_arr.include?(0))
    end
    #check columns
    (0..8).each do |col|
      current_col = []
      (0..8).each do |row|
        current_col << @grid[row][col].value
      end
      return false unless (current_col == current_col.uniq && !current_col.include?(0))
    end


    # #check each 3x3 grid
    # array = []
    # (0..2).each do |box_row|
    #   (0..2).each do |box_col|
    #     #box_arr << @grid[box_row + row_increment][box_col + col_increment].value
    #
    #   end
    # end

    return true
  end
end
