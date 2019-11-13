require_relative 'dragon'
require_relative 'witch'
require_relative 'the_cave'
require_relative 'movement'
require_relative 'message'



class Game

  attr_reader :ever_been_to_room_three, :torch

  def initialize
    @torch = 10
    @dragon = Dragon.new
    @witch = Witch.new
    @the_cave = TheCave.new
    @movement = Movement.new
    @message = Message.new
    @ever_been_to_room_three = nil
  end

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
      meet_dragon
    elsif position == "room one"
      access_to_secret_passage
    elsif  position == "room two" # three options possible
      if @witch.already_met_witch == true &&  @witch.dead_witch == false
        @message.display_message("you already met the witch")
        round
      elsif
        @witch.already_met_witch == true &&  @witch.dead_witch == true
        @message.display_message("you already kill the witch")
        round
      else
        witch_scenario
      end
    elsif position == "esc"
      @dragon.coward_end
    elsif position == "secret passage" && @ever_been_to_room_three == nil
      in_the_secret_passage
    elsif position == "secret passage" && @ever_been_to_room_three == true
      @message.display_message("Thank's for playing !!")
    else
      round
    end
  end

  def in_the_secret_passage # take the secret passage
    @ever_been_to_room_three = true
    @the_cave.secret_passage(nil,nil,nil,nil,nil,"X")
    @dragon.the_dragon_is_sleeping
  end

  def access_to_secret_passage # show the begining of a secret passage
    @the_cave.is_there_a_secret_passage?(nil,"X",nil,nil,nil)
    @message.display_message("This room is empty")
    round
  end

  def witch_scenario
    @witch.scenario
    @the_cave.the_cave(nil,nil,"X",nil,nil)
    round
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
  end

  def extinguish_the_torch
    @torch -= 1
  end

  def torch_dead?
    if @torch == 0
      abort("Your torch is dead, it's dark, you are lost in the cave, end of the game")
    end
  end

  def get_direction
    @move = gets.chomp
  end

  def meet_dragon
    @message.display_message("Oh my god, the King of Dragons is here")
    @message.display_message("want to fight?(yes/no)")
    ask_for_fight
    scenario_dragon(@response,@witch.witch_give_secret_weapon)
  end

  def ask_for_fight
    @response = gets.chomp
  end

  def scenario_dragon(response, have_secret_weapon) # three scenario possible here
    if response == "yes" && have_secret_weapon == false
      @dragon.fight_without_secret_weapon
    elsif response == "yes" && have_secret_weapon == true
      @dragon.fight_with_secret_weapon
    elsif response == "no"
      @dragon.leave
      round
    else
      @message.display_message("what did you say?")
      fight?
    end
  end
end
