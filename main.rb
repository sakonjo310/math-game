require "./players"
require "./questions"

player1 = Players.new("Player 1")
player2 = Players.new("Player 2")

turn = 0

while (player1.alive? && player2.alive?) do
  player = (turn == 0) ? player1 : player2
  puts '----- NEW TURN -----'
  question = Questions.new
  puts "#{player.name}: #{question.display}"
  print '> '
  answer = gets.chomp

  if answer.to_i == question.answer
    puts 'YES! You are correct.'
  else
    puts 'Seriously? No!'
    player.lives -= 1
  end
  puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"

  turn = (turn + 1) % 2
end

if (player1.lives == 0)
  puts "#{player2.name} wins with a score of #{player2.lives}/3"
elsif (player2.lives == 0)
  puts "#{player1.name} wins with a score of #{player1.lives}/3"
end
puts '----- GAME OVER -----'
puts 'Good bye!'
