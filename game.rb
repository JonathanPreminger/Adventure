require_relative 'lib/the_cave'
require_relative 'lib/movement'
require_relative './message'
require_relative './round_action'

class Game

  attr_reader :ever_been_to_room_three

  def initialize
    @the_cave = TheCave.new
    @movement = Movement.new
    @message = Message.new
    @round_action = RoundAction.new(10)
  end


  def play(safe_mode: true)
    start
    enter_the_cave
  rescue => error
    if safe_mode
      end_game(message: "We are very sorry but an error occurred.")
    else
      raise error
    end
  end

  def end_game(success:, message:)
    if $life > 0 && success == true
      abort message
      sleep 3
    elsif  $life <= 1
      puts message
      abort "It was your last life, bye bye !!!"
    elsif $life > 0 && success == false
      puts message
      $life -= 1
      sleep 3
      Game.new.play(safe_mode: false)
    end
  end

  private


  def start
    puts "start"
    Object.const_set("GAME", self)
  end

  def enter_the_cave
    @message.display_message("Welcome in the Black Knight's quest")
    @message.display_message("you have to find the King of Dragons in his deep cave...")
    @message.display_message("Your torch is at #{RoundAction.class_variable_get(:@@torch)}")
    @the_cave.map_the_move(nil)
    @message.display_message("you just arrived in the cave")
    @the_cave.map_the_move("origin")
    @message.display_message("that's you")
    @round_action.round
  end

end
