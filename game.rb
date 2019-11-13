require_relative 'the_cave'
require_relative 'movement'
require_relative 'message'
require_relative 'round_action'



class Game

  attr_reader :ever_been_to_room_three, :torch

  def initialize
    @the_cave = TheCave.new
    @movement = Movement.new
    @message = Message.new
    @round_action = RoundAction.new
  end

  def start(safe_mode: true)
    enter_the_cave
  end

  private

  def enter_the_cave
    @message.display_message("Welcome in the Black Knight's quest")
    @message.display_message("you have to find the King of Dragons in his deep cave...")
    @message.display_message("Your torch is at #{@round_action.torch}")
    @the_cave.the_cave(nil,nil,nil,nil,nil)
    @message.display_message("you just arrived in the cave")
    @the_cave.the_cave("X",nil,nil,nil,nil)
    @message.display_message("that's you")
    @round_action.round
  end

end
