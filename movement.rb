
class Movement

  attr_accessor :position

  def initialize
    @position = ""
  end

  def movement(move, position, ever_been_to_room_three)
    if move == "\e[D"
      to_the_left(position, ever_been_to_room_three)
    elsif  move == "\e[C"
      to_the_right(position, ever_been_to_room_three)
    elsif  move == "\e[B"
      to_the_bottom(position, ever_been_to_room_three)
    elsif  move == "\e[A"
      to_the_top(position, ever_been_to_room_three)
    end
  end

  def to_the_left(position, ever_been_to_room_three)
    if position == "room two"
      @position = "origin"
    elsif position == "origin" && ever_been_to_room_three == nil # Prevent from leaving without finding the dragon
      cannot_get_out
    elsif position == "origin" && ever_been_to_room_three == true
      @position = "esc"
    else
      wrong_direction
    end
  end

  def to_the_right(position, ever_been_to_room_three)
    if position == "room one" && ever_been_to_room_three == nil
      @position = "secret passage"
    elsif  position == "room one" && ever_been_to_room_three == true
      get_out
    elsif position == "origin" && ever_been_to_room_three == nil
      @position = "room two"
    elsif position == "origin" && ever_been_to_room_three == true
      get_out
    else
      wrong_direction
    end
  end

  def  to_the_bottom(position, ever_been_to_room_three)
    if position == "origin" && ever_been_to_room_three == nil
      @position = "room three"
    elsif position == "origin" && ever_been_to_room_three == true
      get_out
    elsif position == "room one"
      @position = "origin"
    else
      wrong_direction
    end
  end

  def to_the_top(position, ever_been_to_room_three)
    if position == "origin"
      @position = "room one"
    elsif position == "room three"
      @position = "origin"
    else
      @dialogue.wrong_direction
    end
  end

  def wrong_direction
    puts "Focus on the four arrows and don't choose a wrong direction Mr. blind !"
    sleep 2
  end

  def get_out
    puts "get out !!! he's gonna burn you up !"
    sleep 2
  end

  def cannot_get_out
    puts "You did a long quest to finally find this cave, you can't run away now !"
    sleep 1
  end

end
