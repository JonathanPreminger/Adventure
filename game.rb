require_relative 'dragon'
require_relative 'witch'
require_relative 'the_cave'
require_relative 'movement'
require_relative 'message'
require_relative 'end_game'



class Game

  attr_reader :ever_been_to_room_three, :torch

  def initialize
    @torch = 10
    @dragon = Dragon.new
    @witch = Witch.new
    @the_cave = TheCave.new
    @movement = Movement.new
    @message = Message.new
    @end_game = EndGame.new
  end

  def start(safe_mode: true)
    enter_the_cave
  end

  private

  def enter_the_cave
    @message.display_message("Welcome in the Black Knight's quest")
    @message.display_message("you have to find the King of Dragons in his deep cave...")
    @message.display_message("Your torch is at #{@torch}")
    @the_cave.the_cave(nil,nil,nil,nil,nil)
    @message.display_message("you just arrived in the cave")
    @movement.position = "origin"
    @the_cave.the_cave("X",nil,nil,nil,nil)
    @message.display_message("that's you")
    round
  end

  def check_room(position,ever_been_to_room_three)
    ever_been_to_room_three = @ever_been_to_room_three
    if position == "room three" && @ever_been_to_room_three == nil
      @ever_been_to_room_three = true
      @dragon.meet_dragon
    elsif position == "room one"
      @the_cave.access_to_secret_passage
    elsif  position == "room two" # three options possible
      if @witch.already_met_witch == true &&  @witch.dead_witch == false
        @message.display_message("you already met the witch")
      elsif
        @witch.already_met_witch == true &&  @witch.dead_witch == true
        @message.display_message("you already kill the witch")
      else
        @witch.witch_scenario
      end
    elsif position == "esc"
      @dragon.coward_end
    elsif position == "secret passage" && @ever_been_to_room_three == nil
      @the_cave.in_the_secret_passage
    elsif position == "secret passage" && @ever_been_to_room_three == true
      @message.display_message("Thank's for playing !!")
    end
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

  def extinguish_the_torch
    @torch -= 1
  end

  def torch_dead?
    if @torch < 1
      @end_game.ending_game("Your torch is dead, it's dark, you are lost in the cave, end of the game")
    end
  end

  def get_direction
    @move = gets.chomp
  end

end
