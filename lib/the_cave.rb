require_relative "../message"
require_relative "../round_action"
require_relative "../non_playing_characters/dragon"

class TheCave

  def initialize
    @message = Message.new
    @dragon = Dragon.new
  end

  def map_the_move(position)
    case position
      when "origin" then the_cave("X",nil,nil,nil,nil)
      when "room one" then the_cave(nil,"X",nil,nil,nil)
      when "room two" then the_cave(nil,nil,"X",nil,nil)
      when "room three" then the_cave(nil,nil,nil,"X",nil)
      when "esc" then the_cave(nil,nil,nil,nil,"X")
      when "nil" then the_cave(nil,nil,nil,nil,nil)
    end
  end

  def access_to_secret_passage # show the begining of a secret passage
    is_there_a_secret_passage?
    @message.display_message("This room is empty")
  end

  def in_the_secret_passage # take the secret passage
    @ever_been_to_room_three = true
    secret_passage
    @dragon.the_dragon_is_sleeping
  end

  private

  def the_cave(origin,one,two,three,four)
    puts `clear`
    puts "   "
    puts "   "
    puts "   "
    puts "             #{one}   "
    puts "         |       |   "
    puts "         |__   __|   "
    puts "            | |    ______"
    puts "     _______| |___|      |"
    puts "#{four}             #{origin}        #{two}      "
    puts "     _______   ___     "
    puts "            | |   |______|"
    puts "           _| |_ "
    puts "          |     | "
    puts "             #{three} "
    puts "          |_____| "
    puts "TORCH :#{RoundAction.class_variable_get(:@@torch)} "
    puts "____________"
    puts "LIFE : #{$life}"
    puts "____________"
    sleep 1
  end

  def is_there_a_secret_passage?
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |__ "
    puts "             X    __   "
    puts "         |       |   "
    puts "         |__   __|   "
    puts "            | |    ______"
    puts "     _______| |___|      |"
    puts "    "
    puts "     _______   ___     "
    puts "            | |   |______|"
    puts "           _| |_ "
    puts "          |     | "
    puts "              "
    puts "          |_____| "
    puts "TORCH :#{RoundAction.class_variable_get(:@@torch)} "
    puts "____________"
    puts "LIFE : #{$life}"
    puts "____________"
  end

  def secret_passage
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "                 _____________ X |   "
    puts "         |       |            |  |"
    puts "         |__   __|            "
    puts "            | |    ______     "
    puts "     _______| |___|      |    "
    puts "          "
    puts "     _______   ___            "
    puts "            | |   |______|    "
    puts "           _| |_              "
    puts "          |     |              "
    puts "                           "
    puts "          |_____|             "
    sleep 1
    @message.display_message("Where ...")
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "                  _____________  |   "
    puts "         |       |            |  |"
    puts "         |__   __|            |  |"
    puts "            | |    ______     |  |"
    puts "     _______| |___|      |    | X|"

    puts "                              |  |      "

    puts "     _______   ___            |  |"
    puts "            | |   |______|    |  |"
    puts "           _| |_              |  |"
    puts "          |     |             |  | "
    puts "                              |  | "
    puts "          |_____|             "
    puts "            "
    @message.display_message("Where this ...")
    sleep 1
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "                  _____________  |   "
    puts "         |       |            |  |"
    puts "         |__   __|            |  |"
    puts "            | |    ______     |  |"
    puts "     _______| |___|      |    |  |"
    puts "                              |  |      "
    puts "     _______   ___            |  |"
    puts "            | |   |______|    |  |"
    puts "           _| |_              |  |"
    puts "          |     |             |  | "
    puts "                              |  | "
    puts "          |_   _|             |  |"
    puts "                  ____________|  |"
    puts "                  _____________X_|"
    @message.display_message("Where this passage ...")
    sleep 1
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "                  _____________  |   "
    puts "         |       |            |  |"
    puts "         |__   __|            |  |"
    puts "            | |    ______     |  |"
    puts "     _______| |___|      |    |  |"
    puts "                              |  |      "
    puts "     _______   ___            |  |"
    puts "            | |   |______|    |  |"
    puts "           _| |_              |  |"
    puts "          |     |             |  | "
    puts "                              |  | "
    puts "          |_   _|             |  |"
    puts "            | |_______________|  |"
    puts "            |X___________________|"
    @message.display_message("Where this passage go ...")
    sleep 1
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "                  _____________  |   "
    puts "         |       |            |  |"
    puts "         |__   __|            |  |"
    puts "            | |    ______     |  |"
    puts "     _______| |___|      |    |  |"
    puts "                              |  |      "
    puts "     _______   ___            |  |"
    puts "            | |   |______|    |  |"
    puts "           _| |_              |  |"
    puts "          |     |             |  | "
    puts "           X                  |  | "
    puts "          |_ X _|             |  |"
    puts "            | |_______________|  |"
    puts "            |____________________|"
    @message.display_message("The Dragon !!!")
    sleep 2
  end
end
