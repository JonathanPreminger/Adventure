require_relative 'dragon'
class Room

  def self.the_cave
    puts `clear`
    puts "          _______ "
    puts "          |     | "
    puts "             #{@room_one}   "
    puts "          |     |   "
    puts "            | |    ____"
    puts "     _______| |___|    |"
    puts "#{@esc}             #{@origin}        #{@room_two}      "
    puts "     _______   ___     "
    puts "            | |   |____|"
    puts "           _| |_ "
    puts "          |     | "
    puts "             #{@room_three} "
    puts "          |_____| "
    Room.check_dragon_presence
  end

  def self.move
    move = gets.chomp
    if move == "\e[A" && @origin == "X"
      Room.one
    elsif move == "\e[A" && @room_three == "X"
      Room.origin
    elsif move == "\e[C" && @origin == "X"
      Room.two
    elsif  move == "\e[B" && @origin == "X"
      @ever_been_to_room_three = 1
      Room.three
    elsif  move == "\e[B" && @room_one == "X"
      Room.origin
    elsif  move == "\e[D" && @room_two == "X"
      Room.origin
    elsif  move == "\e[D" && @origin == "X" && @ever_been_to_room_three == nil
      puts "You did a long quest to finally find this cave, you can't run away now !"
      sleep 3
      Room.the_cave
    elsif  move == "\e[D" && @origin == "X" && @ever_been_to_room_three == 2
      Room.escape
    else
      puts "press 'h' to know how to move"
      Room.move
    end
  end

  def self.origin
    @origin = "X"
    @room_one = ""
    @room_two = ""
    @room_three = ""
    Room.the_cave
  end

  def self.one
    @origin = ""
    @room_one = "X"
    @room_two = ""
    @room_three = ""
    Room.the_cave
  end

  def self.two
    @origin = ""
    @room_one = ""
    @room_two = "X"
    @room_three = ""
    Room.the_cave
  end

  def self.three
    @origin = ""
    @room_one = ""
    @room_two = ""
    @room_three = "X"
    Room.the_cave
  end

  def self.escape
    @origin = ""
    @room_one = ""
    @room_two = ""
    @room_three = ""
    @esc = "X"
    Room.the_cave
  end

  def self.check_dragon_presence
    if @room_three == "X" && @ever_been_to_room_three == 1
      puts "Oh my god, the king dragons is here"
      @ever_been_to_room_three +=1
      Dragon.fight?
    elsif @room_three == "X" && @ever_been_to_room_three == 2
      Dragon.run
    elsif @room_one == "X" || @room_two == "X"
      puts "This room is empty"
      Room.move
    elsif @esc == "X"
      Adventure.coward_end
    else
      Room.move
    end
  end

  def self.coward_end
    puts "Bravo bravo bravo !!!!! You saved your life ! Now stop thinking you're a Knight and go home"
  end
end
#left : "\e[D"
#right : "\e[C"
#left : "\e[A"
#left : "\e[B"
