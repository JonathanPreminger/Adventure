require_relative 'game'


class Dragon

  def coward_end
    puts "Bravo! You saved your life ! What a Knight"
  end

  def fight_without_secret_weapon
    puts "He just burn you up, you're dead, Game Over..."
    sleep 1
  end

  def fight_with_secret_weapon
    puts "You kill the King's Dragon with the Magic Secret Weapon !!! Game Success !!!"
    sleep 1
  end

  def the_dragon_is_sleeping
    puts "the dragon is sleeping, he didn't see you yet, kill him ! Success !!!"
    sleep 1
  end
end
