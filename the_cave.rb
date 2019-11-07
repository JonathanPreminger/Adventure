
class TheCave
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
    puts "Where ..."
    sleep 1

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
    puts "            "
    sleep 1
    puts "Where this..."
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
    sleep 1
    puts "Where this passage..."
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
    sleep 1
    puts "Where this passage go ??!"
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
    puts "The Dragon !!"
    sleep 2
  end
end
