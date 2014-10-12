require './spec_helper'

# Batteries are items that can be used by robot to recharge its shield. Implement Battery item that can be used to recharge the Robot’s shield.


describe Battery do
  subject(:battery) { Battery.new }
  let(:robot) { Robot.new }

  describe "battery" do

    it "should return the robot to full shields" do
      robot.wound(30)
      battery.recharge(robot)
      expect(robot.shield).to eq(50)
    end

  

  end

end
