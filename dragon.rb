
class Dragon

  def self.fight?
    puts "wanna fight?"
    response = gets.chomp
    if response == "yes"
      puts "lets fight..."
      Dragon.fight_indeed
    elsif response == "no"
      puts "what a coward ! Run before he burn you up !"
      sleep 1
      Room.three
    else
      puts "what did you say ?"
      Dragon.fight?
    end
  end

  def self.run
    puts "You have 5 seconds to leave the cave !!!"
    Room.move
  end

  def self.fight_indeed
  end

end
