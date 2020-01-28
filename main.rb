require_relative 'game'
puts `clear`

$life = 3
Game.new.play(safe_mode: false)
