require_relative 'board'
require 'colorize'
require 'colorized_string'
class Game

  def initialize
    @board = Board.new
  end

  def play
    until @board.solved?
      self.render
      pos = get_position
      new_value = get_value
      update(pos,new_value)
    end
    puts "you win"
  end

  def update(pos,new_value)
    @board[pos] = new_value
  end

  def get_position
    puts "please enter row"
    row = gets.chomp.to_i
    puts "please enter column"
    col = gets.chomp.to_i

    if @board[[row,col]].is_a?(String)
      puts "that is a fixed value"
      row,col = get_position
    end
    return [row,col]
  end

  def get_value
    puts "please enter value"
    gets.chomp.to_i
  end

  def render
    (0..8).each do |row|
      (0..8).each do |col|
        spot = @board[[row, col]]
        print spot.to_s .colorize(:blue) if spot.is_a?(Integer)
        print spot .colorize(:red) if spot.is_a?(String)
       end
      puts "\n"
    end
  end


end
#File.readlines("dictionary.txt").map(&:chomp)
