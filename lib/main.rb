require_relative "board.rb"
require_relative "player.rb"

system "clear"

puts "Welcome to Tic Tac Toe!"

players = [p1 = Player.new(''), p2 = Player.new('')]

players.each { |player|
  puts "Please enter player #{players.index(player)+1}'s name: "
  name = ""
  loop do
    name = gets.chomp
    break if name != ""
  end
  player.name = name
  puts "Thank you #{player.name}! You are the #{player.token}'s."
  system "clear"
}


board = Board.new

board.show

turn = players.sample
win = 0

while win == 0
  puts "It's #{turn.name}'s turn, make your move!"
  move = ""

  loop do
    begin
      move = gets.chomp
      break if move.length == 2 && ['a', 'b', 'c'].include?(move[0]) && move[1].to_i.between?(1, 3)
      puts "Wrong case! Remember to specify the column from 'a' to 'c' and the row from 1 to 3, like so: a2"
    rescue
        puts "Wrong case! Remember to specify the column from 'a' to 'c' and the row from 1 to 3, like so: a2"
    end
  end

  system "clear"
  if board.move(turn, move) != nil 
    puts "#{turn.name}, you moved to #{move}!"
    
  end
  board.show

  # binding.pry

  if board.check_win?(turn)
    puts "Congratulations #{turn.name} you won this round!"
    win = 1
    turn.score += 1
  end
  turn = (players - [turn])[0]

end