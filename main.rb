
require_relative 'game'
puts `clear`

@game = Game.new
@dragon = Dragon.new
@witch = Witch.new
@the_cave = TheCave.new
@game.enter_the_cave
