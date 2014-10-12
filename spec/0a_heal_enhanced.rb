require './spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  describe "#heal!" do
    it "should not allow robot to heal if dead" do
      # robot.health = 0 - this should not be used because health should be attr_reader only
      robot.should_receive(:health).and_return(0)
      expect { robot.heal!(20) }.to raise_error RobotAlreadyDeadError
    end
  end

end