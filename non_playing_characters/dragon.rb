require_relative "../message"
require_relative "../end_game"

class Dragon

  def initialize
    @message = Message.new
    @end_game = EndGame.new
  end

  def meet_dragon(secret_weapon)
    @message.display_message("Oh my god, the King of Dragons is here")
    @message.display_message("want to fight?(yes/no)")
    ask_for_fight
    scenario_dragon(@response,secret_weapon)
  end

  def the_dragon_is_sleeping
    @end_game.ending_game("the dragon is sleeping, he didn't see you yet, kill him ! Success !!!")
  end

  def coward_end
    @end_game.ending_game("Bravo! You saved your life ! What a Knight")
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
    @end_game.ending_game("He just burn you up, you're dead, Game Over...")
  end

  def fight_with_secret_weapon
    @message.display_message("lets fight...")
    @end_game.ending_game("You kill the King's Dragon with the Magic Secret Weapon !!! Game Success !!!")
  end

  def leave
    @message.display_message("what a coward ! Run before he burn you up !")
    @message.display_message("You have 5 seconds to leave the cave !!!")
  end

end
