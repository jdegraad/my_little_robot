require './spec_helper'

# The Robot class can be asked to return all robots in a given position (x,y). It should return an array of all the robots since multiple robots could potentially be at position 0,0 (for example)

describe Robot do
  subject(:robot) { Robot.new }

  describe "return all robots at x, y" do

    it "should store and then list all the robots in the game" do
      expect(Robot::list).to start_with []
    end

    describe "let's make some robots" do
      let(:one) { Robot.new }
      let(:two) { Robot.new }
      let(:three) { Robot.new }
    it "should list all robots in the game, as objects!" do
      expect(Robot::list).to include one, two
    end

    it "should then reveal any robots with x,y passed as arguments" do
      one.move_down # (it is now at [0,-1])
      two.move_down 
      # three.move_down
      expect(Robot::find(0,-1)).to include one
      expect(Robot::find(0,-1).length).to eq(2)

    end

    end # end of the second describe block

  end

end
