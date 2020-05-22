require_relative 'game'
puts `clear`

$life = 3
puts "yes"
Game.new.play(safe_mode: false)
