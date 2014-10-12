require './spec_helper'

# Robots can start with 50 shield points. When the robot is damaged it first drains the shield and then starts affecting actual health.

# You will likely also have to fix previous tests that will fail due to this enhancement. However, focus on running spec 16 until you are done, then rerun all your tests to find other failing tests and modify the tests to modify their expectations.

describe Robot do
  subject(:robot) { Robot.new }
  let(:badguy) { Robot.new }

  describe "shields" do

    it "should start with 50 shield points" do
      robot.shield.should eq(50)
    end

    it "should take damage before passing damage to health" do
      badguy.attack(robot)
      expect(robot.health).to eq(100)
      expect(robot.shield).to eq(45)
    end 

  end

end
