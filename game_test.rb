
  require_relative '../non_playing_characters/dragon'
  require_relative '../non_playing_characters/witch'
  require_relative '../game.rb'


  describe Book do

    it "fais des trucs"
      expect(Game.end_game(message: "bibim")).to eq "bibim"
  end
