require_relative "../message"

class Dragon

  def initialize
    @message = Message.new
  end

  def meet_dragon(secret_weapon)
    @message.display_message("Oh my god, the King of Dragons is here")
    @message.display_message("want to fight?(yes/no)")
    ask_for_fight
    scenario_dragon(@response,secret_weapon)
  end

  def the_dragon_is_sleeping
    GAME.end_game(success:true, message: "the dragon is sleeping, he didn't see you yet, kill him ! Success !!!")
  end

  def coward_end
    GAME.end_game(success:false, message: "Bravo! You saved your life ! But the Dragon is still alive... What a Knight")
  end

  private

  def ask_for_fight
    @response = gets.chomp
  end

  def scenario_dragon(response, secret_weapon) # three scenario possible here
    if response == "yes" && secret_weapon == false
      fight_without_secret_weapon
    elsif response == "yes" && secret_weapon == true
      fight_with_secret_weapon
    elsif response == "no"
      leave
    else
      @message.display_message("what did you say?")
      meet_dragon(secret_weapon)
    end
  end

  def fight_without_secret_weapon
    @message.display_message("lets fight...")
    GAME.end_game(message: "He just burn you up, you're dead, Game Over...", success:false)
    sleep 3
  end

  def fight_with_secret_weapon
    @message.display_message("lets fight...")
    GAME.end_game(message: "You kill the King's Dragon with the Magic Secret Weapon !!! Game Success !!!", success:true)
    sleep 3
  end

  def leave
    @message.display_message("what a coward ! Run before he burn you up !")
    @message.display_message("You have 5 seconds to leave the cave !!!")
  end

end
