require_relative 'board.rb'
#require_relative 'card.rb'
require 'byebug'

class Game

def initialize(board = Board.new)
  @board = board
  @previous_pos = nil
  @current_pos = nil
end

def play
  counter = 0
  until @board.won?
    puts "new turn"
    @board.render
    @previous_pos = receive_input
    @board.reveal(@previous_pos)

    @board.render
    @current_pos = receive_input
    @board.reveal(@current_pos)
    @board.render
    if !@board[@current_pos].compare(@board[@previous_pos])

      sleep(10)
      @board[@current_pos].hide
      @board[@previous_pos].hide
      puts "not a match"
    else
      puts "its a match!"
    end

    counter += 1
  end

end

def receive_input
  #still need to add possible errors

  puts "please input the position you want to guess"
  position = gets.chomp.split(",")
  row = Integer(position[0])
  col = Integer(position[1])
  return [row,col]
end





end
