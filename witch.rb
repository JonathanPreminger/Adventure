require_relative "message"

class Witch
  attr_reader :witch_give_secret_weapon, :dead_witch, :already_met_witch

  def initialize
    @witch_give_secret_weapon = false
    @dead_witch = false
    @already_met_witch = false
    @message = Message.new
  end

  def scenario
    @already_met_witch = true
    meet_the_witch
    @message.display_message("What do you want to do ? (kneel/hit)")
    @decision = get_decision
    apply_choice(@decision)
  end

  def get_weapon
    kneel
    nice_witch
    sleep 1
    @witch_give_secret_weapon = true
  end

  def didnt_get_weapon
    @witch_give_secret_weapon = false
    @dead_witch = true
    hit_witch
    sleep 1
  end

  def meet_the_witch
     puts`clear`
     puts "     ____           /\\ "
     puts "    _|..|_  /    __/  \\__"
     puts "   | |  | |/        °°     |"
     puts "     |  |        --/  \\--- |"
     puts "     |  |         /    \\   |"
     puts "    _|  |_       / _ _  \\ /|\\ "
     puts "___________________________________________"
     sleep 1
     @message.display_message("Oh! you met the Dark witch, witch is sometimes nice and sometimes not")
     sleep 1
   end

   def get_decision
     gets.chomp
   end

   def apply_choice(decision)
     if decision == "kneel"
       sleep 1
       get_weapon
     elsif decision == "hit"
       sleep 1
       didnt_get_weapon
     else
       @message.display_message("you didn't respond to the question properly")
       scenario
     end
   end

   def nice_witch
     @message.display_message("you seems to be a good Knight, I'll give you a special trick that will help you to kill the king of dragons")
     sleep 2

   end

   def kneel
    puts `clear`
    puts "        __               /\\"
    puts "      _| vv|_         __/  \\__        "
    puts "       | _ |             °°     |        "
    puts "       / ____|_       --/  \\--- |"
    puts "      /__    |         /_ _ \\  /|\\     "
    puts "    _|   |_  |        / _ _  \\ /|\\"

  end

  def hit_witch
    puts `clear`
    puts "_______|__ "
    puts "       \\"
    puts "     ___\\           /\\ "
    puts "    _|..|        __/  \\__"
    puts "   | |  |           °°     |"
    puts "     |  |        --/  \\--- |"
    puts "     |  |         /    \\   |"
    puts "    _|  |_       / _ _  \\ /|\\ "

    sleep 1
    puts `clear`
    puts "         \\ "
    puts "          \\ "
    puts "          ~\\~"
    puts "     ____ / \\       /\\ "
    puts "    _|..|/       __/  \\__"
    puts "   | |  |           °°     |"
    puts "     |  |        --/  \\--- |"
    puts "     |  |         /    \\   |"
    puts "    _|  |_       / _ _  \\ /|\\ "
    sleep 1
    puts `clear`
    puts "     ____  \\       /\\ "
    puts "    _|..|__~\\~  __/  \\__"
    puts "   | |  |    \\     °0°     |"
    puts "     |  |     \\ --/  \\--- |"
    puts "     |  |        /    \\   |"
    puts "    _|  |_      / _ _  \\ /|\\ "
    sleep 1
    puts `clear`
    puts "     ____  \\       "
    puts "    _|..|__~\\~ "
    puts "   | |  |    \\            |"
    puts "     |  |     \\ --/  \\--- |       /\\"
    puts "     |  |        /    \\   |    __/  \\__"
    puts "    _|  |_      / _ _  \\ /|\\     °_° "
    sleep 3
  end
end
