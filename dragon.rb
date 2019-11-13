require_relative "message"

class Dragon

  def initialize
    @message = Message.new
  end

  def coward_end
    abort("Bravo! You saved your life ! What a Knight")
  end

  def fight_without_secret_weapon
    @message.display_message("lets fight...")
    abort("He just burn you up, you're dead, Game Over...")
  end

  def fight_with_secret_weapon
    @message.display_message("lets fight...")
    abort("You kill the King's Dragon with the Magic Secret Weapon !!! Game Success !!!")
  end

  def leave
    @message.display_message("what a coward ! Run before he burn you up !")
    @message.display_message("You have 5 seconds to leave the cave !!!")
  end

  def the_dragon_is_sleeping
    abort("the dragon is sleeping, he didn't see you yet, kill him ! Success !!!")
  end
end
