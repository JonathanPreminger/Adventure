
  require_relative '../game.rb'
  require_relative '../message.rb'
  require_relative '../lib/movement.rb'
  require_relative '../non_playing_characters/witch.rb'

  # 1
  describe 'movement#movement' do
    it 'place the player on origin from room two' do
      @movement = Movement.new
      expect(@movement.movement("\e[D", "room two", nil)).to eq("origin")
    end
    # 2
    context 'didnt find dragon' do # rspec expect one instead of a string
      it 'prevent of escaping' do
        @movement = Movement.new
        expect(@movement.movement("\e[D", "origin", nil)).to eq("You did a long quest to finally find this cave, you can't run away now !")
      end
    end
  end
  # 4
  describe 'message#deliver_message' do # rspect expect 1 instead of a string
    it 'deliver a message' do
      @message = Message.new
      expect(@message.display_message("hello")).to eq("hello")
    end
  end
  # 5
  describe 'witch#initialize' do
    it 'return false' do
      @witch = Witch.new
      expect(@witch.already_met_witch).to eq false
    end
  end
  # 6
  describe 'game#end_game' do
    it 'return a string' do
      @game = Game.new
      expect(@game.end_game(message: "end")).to eq("end")
    end
  end
