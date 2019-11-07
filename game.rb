require_relative 'dragon'
require_relative 'witch'
require_relative 'secret_passage'
require_relative 'the_cave'

class Game

  def initialize
    @dragon = Dragon.new
    @witch = Witch.new
    @the_cave = TheCave.new
    @ever_been_to_room_three = nil
  end

  def enter_the_cave
    puts "Welcome in the Black Knight's quest"
    sleep 1
    puts "you have to find the King of Dragons in his deep cave..."
    sleep 1
    @the_cave.the_cave(nil,nil,nil,nil,nil)
    #sleep 1
    puts "you just arrived in the cave"
    #sleep 2
    position(0)
    @the_cave.the_cave("X",nil,nil,nil,nil)
    #sleep 1
    puts "that's you"
    #sleep 1
    loop
  end

  def check_room(one,two,three,esc,secret,ever_been_to_room_three)
    ever_been_to_room_three = @ever_been_to_room_three
    if three == "X" && @ever_been_to_room_three == nil
      puts "Oh my god, the King of Dragons is here"
      @ever_been_to_room_three = true
      meet_dragon
    elsif three == "X" && @ever_been_to_room_three == true

    elsif one == "X"
      access_to_secret_passage
    elsif  two == "X" # three options possible
      if @witch.already_met_witch == true &&  @witch.dead_witch == false
        puts "you already met the witch"
        loop
      elsif
        @witch.already_met_witch == true &&  @witch.dead_witch == true
          puts "you already kill the witch"
          loop
      else
        witch_scenario
      end
    elsif esc == "X"
      @dragon.coward_end
    elsif secret == "X" && @ever_been_to_room_three == nil
      in_the_secret_passage
    elsif secret == "X" && @ever_been_to_room_three == true
      the_end
    else
      loop
    end
  end

  def the_end
    puts "Thank's for playing !!"
  end

  def in_the_secret_passage # take the secret passage
    @ever_been_to_room_three = true
    @the_cave.secret_passage(nil,nil,nil,nil,nil,"X")
    sleep 1
    @dragon.the_dragon_is_sleeping
  end

  def access_to_secret_passage # show the begining of a secret passage
    @the_cave.is_there_a_secret_passage?(nil,"X",nil,nil,nil)
    puts "This room is empty"
    sleep 1
    loop
  end

  def witch_scenario
    @witch.scenario
    @the_cave.the_cave(nil,nil,"X",nil,nil)
    loop
  end

  def loop
    puts "where do you want to go?(arrow keys + enter)"
    get_direction
    movement(@move,@origin,@room_one,@room_two,@room_three,@esc,@ever_been_to_room_three)
    @the_cave.the_cave(@origin,@room_one,@room_two,@room_three,@esc)
    check_room(@room_one,@room_two,@room_three,@esc,@room_secret,@ever_been_to_room_three)
  end

  def position(position)
    array_with_position = Array.new
    array_with_position[position] = "X"
    @origin = array_with_position[0]
    @room_one = array_with_position[1]
    @room_two = array_with_position[2]
    @room_three = array_with_position[3]
    @esc = array_with_position[4]
    @room_secret = array_with_position[5]
    array_with_position
  end

  def get_direction
    @move = gets.chomp
  end

  def movement(move, origin, room_one, room_two, room_three, esc, ever_been_to_room_three) # All movements allowed
    if move == "\e[A" && origin == "X"
      position(1)
    elsif move == "\e[A" && room_three == "X"
      position(0)
    elsif move == "\e[C" && origin == "X" && ever_been_to_room_three == nil
      position(2)
    elsif  move == "\e[B" && origin == "X" && ever_been_to_room_three == nil
      position(3)
    elsif  move == "\e[C" && room_one == "X" && ever_been_to_room_three == true
      puts "get out !!! he's gonna burn you up !"
      sleep 1
      position(1)
    elsif move == "\e[B" && origin == "X" && ever_been_to_room_three == true || move == "\e[C" && origin == "X" && ever_been_to_room_three == true
      puts "get out !!! he's gonna burn you up !"
      sleep 1
      position(0)
    elsif  move == "\e[B" && room_one == "X"
      position(0)
    elsif  move == "\e[C" && room_one == "X" && ever_been_to_room_three == nil
      position(5)
    elsif  move == "\e[D" && room_two == "X"
      position(0)
    elsif  move == "\e[D" && origin == "X" && ever_been_to_room_three == nil # Prevent from leaving without finding the dragon
      puts "You did a long quest to finally find this cave, you can't run away now !"
      sleep 1
    elsif  move == "\e[D" && origin == "X" && ever_been_to_room_three == true
      position(4)
    else
      puts "Focus on the four arrows and don't choose a wrong direction Mr. blind !"
      sleep 2
    end
  end

  def meet_dragon
    puts "want to fight?(yes/no)"
    ask_for_fight
    scenario_dragon(@response,@witch.witch_give_secret_weapon)
  end

  def ask_for_fight
    @response = gets.chomp
  end

  def scenario_dragon(response, have_secret_weapon) # three scenario possible here
    if response == "yes" && have_secret_weapon == false
      puts "lets fight..."
      @dragon.fight_without_secret_weapon
    elsif response == "yes" && have_secret_weapon == true
      puts "lets fight..."
      @dragon.fight_with_secret_weapon
    elsif response == "no"
      puts "what a coward ! Run before he burn you up !"
      puts "You have 5 seconds to leave the cave !!!"
      sleep 1
      loop
    else
      puts "what did you say ?"
      fight?
    end
  end
end
