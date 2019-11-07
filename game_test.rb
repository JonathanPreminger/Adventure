  require "minitest/autorun"
  require 'minitest/hooks/default'
  require_relative 'dragon'
  require_relative 'game'
  require_relative 'witch'



class MyTest < Minitest::Test
  include Minitest::Hooks
end


class GameTest < MyTest

  describe "all advenutre's end" do

    it "will return a string" do
      @dragon = Dragon.new
      assert_output(/Bravo! You saved your life ! What a Knight/) {@dragon.coward_end}
    end

    it "will return a string" do
      @dragon = Dragon.new
      assert_output(/He just burn you up, you're dead, Game Over.../) {@dragon.fight_without_secret_weapon}
    end

    it "will return a string" do
      @dragon = Dragon.new
      assert_output(/You kill the King's Dragon with the Magic Secret Weapon !!! Game Success !!!/) {@dragon.fight_with_secret_weapon}
    end

    it "will return a string" do
      @dragon = Dragon.new
      assert_output(/the dragon is sleeping, he didn't see you yet, kill him ! Success !!!/) {@dragon.the_dragon_is_sleeping}
    end
  end

  describe "knight's possible positions" do

    it "will return position(0)" do
      @game = Game.new
      expectation = ["X"]
      assert_equal expectation, @game.position(0)
    end

    it "will return position(1)" do
      @game = Game.new
      expectation = [nil,"X"]
      assert_equal expectation, @game.position(1)
    end

    it "will return position(2)" do
      @game = Game.new
      expectation = [nil,nil,"X"]
      assert_equal expectation, @game.position(2)
    end

    it "will return position(3)" do
      @game = Game.new
      expectation = [nil,nil,nil,"X"]
      assert_equal expectation, @game.position(3)
    end

    it "will return position(4)" do
      @game = Game.new
      expectation = [nil,nil,nil,nil,"X"]
      assert_equal expectation, @game.position(4)
    end

    it "will return position(4)" do
      @game = Game.new
      expectation = [nil,nil,nil,nil,nil,"X"]
      assert_equal expectation, @game.position(5)
    end
  end

  describe "knigh's exact position after a movement" do

    it "will return position 1" do
      @game = Game.new
      expectation = [nil,"X"]
      assert_equal expectation,@game.movement("\e[A","X",nil,nil,nil,nil,nil)
    end

    it "will return position 0" do
      @game = Game.new
      expectation = ["X"]
      assert_equal expectation,@game.movement("\e[A",nil,nil,nil,"X",nil,nil)
    end

    it "will return position 2" do
      @game = Game.new
      expectation = [nil,nil,"X"]
      assert_equal expectation,@game.movement("\e[C","X",nil,nil,nil,nil,nil)
    end

    it "will return position 3" do
      @game = Game.new
      expectation = [nil,nil,nil,"X"]
      assert_equal expectation,@game.movement("\e[B","X",nil,nil,nil,nil,nil)
    end

    it "will return position 0" do
      @game = Game.new
      expectation = ["X"]
      assert_equal expectation,@game.movement("\e[B",nil,"X",nil,nil,nil,nil)
    end

    it "will return position 5" do
      @game = Game.new
      expectation = [nil,nil,nil,nil,nil,"X"]
      assert_equal expectation,@game.movement("\e[C",nil,"X",nil,nil,nil,nil)
    end

    it "will return position 0" do
      @game = Game.new
      expectation = ["X"]
      assert_equal expectation,@game.movement("\e[D",nil,nil,"X",nil,nil,nil)
    end

    #it "will return position 0" do
    #  @game = Game.new
    #  expectation = ["X"]
    #  assert_equal expectation,@game.movement("\e[D","X",nil,nil,nil,nil,nil)
    #end

    it "will return position 4" do
      @game = Game.new
      expectation = [nil,nil,nil,nil,"X"]
      assert_equal expectation,@game.movement("\e[D","X",nil,nil,nil,nil,true)
    end
    #describe "he already see the dragon" do
    #  it "will return position 0" do
    #    @game = Game.new
    #    expectation = ["X"]
    #    assert_equal expectation, @game.movement("\e[B","X",nil,nil,nil,nil,true)
    #  end
    #  it "will return position 0" do
    #    @game = Game.new
    #    expectation = ["X"]
    #    assert_equal expectation, @game.movement("\e[C","X",nil,nil,nil,nil,true)
    #  end
    #  it "will return position 1" do
    #    @game = Game.new
    #    expectation = [nil,"X"]
    #    assert_equal expectation, @game.movement("\e[C",nil,"X",nil,nil,nil,nil)
    #  end
    #end
  end

  describe "the witch give the Knight a special weapon" do
    it "return a string" do
      @witch = Witch.new
      assert_output(/you seems to be a good Knight, I'll give you a special trick that will help you to kill the king of dragons/) {@witch.nice_witch}
    end
  end
end
