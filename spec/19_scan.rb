require './spec_helper'

# A given robot should be able to scan its surroundings (tiles immediately next to its current @position) Note: You should leverage the class method implemented in #18

describe Robot do
  subject(:robot) { Robot.new }
  let(:one) { Robot.new }
  let(:two) { Robot.new }
  let(:three) { Robot.new }

  describe "#scan" do
    it "should scan all adjacent tiles and return any hits" do
      one.move_up
      two.move_down
      expect(robot.scan).to include [one]
      expect(robot.scan.length).to eq(2)

    end


  end

end
