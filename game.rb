require_relative 'dragon'
require_relative 'witch'
require_relative 'the_cave'
require_relative 'movement'
require_relative 'dialogue'



class Game

  attr_reader :ever_been_to_room_three

  def initialize
    @dragon = Dragon.new
    @witch = Witch.new
    @the_cave = TheCave.new
    @movement = Movement.new
    @dialogue = Dialogue.new
    @ever_been_to_room_three = nil
  end

  def enter_the_cave
    puts "Welcome in the Black Knight's quest"
    sleep 1
    puts "you have to find the King of Dragons in his deep cave..."
    sleep 1
    @the_cave.the_cave(nil,nil,nil,nil,nil)
    sleep 1
    puts "you just arrived in the cave"
    sleep 2
    @movement.position = "origin"
    sleep 2
    @the_cave.the_cave("X",nil,nil,nil,nil)
    sleep 1
    puts "that's you"
    sleep 1
    the_loop
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
        @dialogue.already_met_witch_indeed
        the_loop
      elsif
        @witch.already_met_witch == true &&  @witch.dead_witch == true
        @dialogue.already_kill_the_witch_indeed
        the_loop
      else
        witch_scenario
      end
    elsif position == "esc"
      @dragon.coward_end
    elsif position == "secret passage" && @ever_been_to_room_three == nil
      in_the_secret_passage
    elsif position == "secret passage" && @ever_been_to_room_three == true
      @dialogue.the_end
    else
      the_loop
    end
  end

  def in_the_secret_passage # take the secret passage
    @ever_been_to_room_three = true
    @the_cave.secret_passage(nil,nil,nil,nil,nil,"X")
    @dragon.the_dragon_is_sleeping
  end

  def access_to_secret_passage # show the begining of a secret passage
    @the_cave.is_there_a_secret_passage?(nil,"X",nil,nil,nil)
    @dialogue.room_empty
    the_loop
  end

  def witch_scenario
    @witch.scenario
    @the_cave.the_cave(nil,nil,"X",nil,nil)
    the_loop
  end

  def the_loop
    @dialogue.wich_direction
    get_direction
    @movement.movement(@move,@movement.position,@ever_been_to_room_three)
    puts "the position at the loop point is #{@position}"
    @the_cave.map_the_move(@movement.position)
    check_room(@movement.position,@ever_been_to_room_three)
  end

  def get_direction
    @move = gets.chomp
  end

  def meet_dragon
    @dialogue.want_to_fight?
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
      the_loop
    else
      @dialogue.sorry?
      fight?
    end
  end


end
