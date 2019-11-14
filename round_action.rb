require_relative "non_playing_characters/dragon"
require_relative "non_playing_characters/witch"
require_relative "lib/the_cave"
require_relative "./message"
require_relative "lib/movement"

class RoundAction

  attr_reader :torch

  def initialize
    @torch = 10
    @dragon = Dragon.new
    @witch = Witch.new
    @the_cave = TheCave.new
    @movement = Movement.new
    @message = Message.new
    @end_game = EndGame.new
  end

  def round
    extinguish_the_torch
    torch_dead?
    @message.display_message("Your torch is at #{@torch}")
    @message.display_message("where do you want to go?(arrow keys + enter")
    get_direction
    @movement.movement(@move,@movement.position,@ever_been_to_room_three)
    @the_cave.map_the_move(@movement.position)
    check_room(@movement.position,@ever_been_to_room_three)
    round
  end

  private

  def extinguish_the_torch
    @torch -= 1
  end

  def torch_dead?
    @end_game.ending_game("Your torch is dead, it's dark, you are lost in the cave, end of the game") unless @torch > 0
  end

  def get_direction
    @move = gets.chomp
  end

  def check_room(position,ever_been_to_room_three)
    case position
    when "room three"
      room_three(ever_been_to_room_three)
    when "room one"
      room_one
    when "room two" # three options possible
      room_two
    when "esc"
      escape
    when "secret passage"
      secret_passage(ever_been_to_room_three)
    end
  end

  def room_three(ever_been_to_room_three)
    ever_been_to_room_three = @ever_been_to_room_three
    if @ever_been_to_room_three == nil
    @ever_been_to_room_three = true
    @dragon.meet_dragon(@witch.witch_give_secret_weapon)
    end
  end

  def room_one
    @the_cave.access_to_secret_passage
  end

  def room_two
    if @witch.already_met_witch == true &&  @witch.dead_witch == false
      @message.display_message("you already met the witch")
    elsif
      @witch.already_met_witch == true &&  @witch.dead_witch == true
      @message.display_message("you already kill the witch")
    else
      @witch.witch_scenario
    end
  end

  def escape
    @dragon.coward_end
  end

  def secret_passage(ever_been_to_room_three)
    @the_cave.in_the_secret_passage unless @ever_been_to_room_three != nil
  end

end
