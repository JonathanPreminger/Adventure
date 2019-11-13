require_relative "message"
require_relative "dragon"

class TheCave

  def initialize
    @message = Message.new
    @dragon = Dragon.new
  end

  def map_the_move(position)
    case position
    when "origin"
      the_cave("X",nil,nil,nil,nil)
    when "room one"
      the_cave(nil,"X",nil,nil,nil)
    when "room two"
      the_cave(nil,nil,"X",nil,nil)
    when "room three"
      the_cave(nil,nil,nil,"X",nil)
    when "esc"
      the_cave(nil,nil,nil,nil,"X")
    end
  end

  def access_to_secret_passage # show the begining of a secret passage
    is_there_a_secret_passage?(nil,"X",nil,nil,nil)
    @message.display_message("This room is empty")
  end

  def in_the_secret_passage # take the secret passage
    @ever_been_to_room_three = true
    secret_passage(nil,nil,nil,nil,nil,"X")
    @dragon.the_dragon_is_sleeping
  end

  def the_cave(origin,one,two,three,four)
    puts `clear`
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
    sleep 1
  end

  def is_there_a_secret_passage?(origin,one,two,three,four)
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |__ "
    puts "             #{one}    __   "
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
  end

  def secret_passage(origin,one,two,three,four,secret)
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "             #{one}    _____________ #{secret} |   "
    puts "         |       |            |  |"
    puts "         |__   __|            "
    puts "            | |    ______     "
    puts "     _______| |___|      |    "
    puts "#{four}             #{origin}        #{two}           "
    puts "     _______   ___            "
    puts "            | |   |______|    "
    puts "           _| |_              "
    puts "          |     |              "
    puts "             #{three}                  "
    puts "          |_____|             "
    sleep 1
    @message.display_message("Where ...")
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "             #{one}    _____________   |   "
    puts "         |       |            |  |"
    puts "         |__   __|            |  |"
    puts "            | |    ______     |  |"
    puts "     _______| |___|      |    | #{secret}|"
    puts "#{four}             #{origin}        #{two}         |  |      "
    puts "     _______   ___            |  |"
    puts "            | |   |______|    |  |"
    puts "           _| |_              |  |"
    puts "          |     |             |  | "
    puts "             #{three}                 |  | "
    puts "          |_____|             "
    puts "            "
    @message.display_message("Where this ...")
    sleep 1
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "             #{one}    _____________   |   "
    puts "         |       |            |  |"
    puts "         |__   __|            |  |"
    puts "            | |    ______     |  |"
    puts "     _______| |___|      |    |  |"
    puts "#{four}             #{origin}        #{two}         |  |      "
    puts "     _______   ___            |  |"
    puts "            | |   |______|    |  |"
    puts "           _| |_              |  |"
    puts "          |     |             |  | "
    puts "             #{three}                 |  | "
    puts "          |_   _|             |  |"
    puts "                  ____________|  |"
    puts "                  _____________#{secret}_|"
    @message.display_message("Where this passage ...")
    sleep 1
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "             #{one}    _____________   |   "
    puts "         |       |            |  |"
    puts "         |__   __|            |  |"
    puts "            | |    ______     |  |"
    puts "     _______| |___|      |    |  |"
    puts "#{four}             #{origin}        #{two}         |  |      "
    puts "     _______   ___            |  |"
    puts "            | |   |______|    |  |"
    puts "           _| |_              |  |"
    puts "          |     |             |  | "
    puts "             #{three}                 |  | "
    puts "          |_   _|             |  |"
    puts "            | |_______________|  |"
    puts "            |#{secret}___________________|"
    @message.display_message("Where this passage go ...")
    sleep 1
    puts `clear`
    puts "         _________ "
    puts "         |       |"
    puts "         |       |________________ "
    puts "             #{one}    _____________   |   "
    puts "         |       |            |  |"
    puts "         |__   __|            |  |"
    puts "            | |    ______     |  |"
    puts "     _______| |___|      |    |  |"
    puts "#{four}             #{origin}        #{two}         |  |      "
    puts "     _______   ___            |  |"
    puts "            | |   |______|    |  |"
    puts "           _| |_              |  |"
    puts "          |     |             |  | "
    puts "           X #{three}                 |  | "
    puts "          |_ #{secret} _|             |  |"
    puts "            | |_______________|  |"
    puts "            |____________________|"
    @message.display_message("The Dragon !!!")
    sleep 2
  end
end
