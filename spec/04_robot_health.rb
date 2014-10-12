require './spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  describe "#health" do
    its(:health) { should eq(100) }
  end

  describe "#wound" do
    it "decreases health" do
      robot.wound(20)
      robot.health.should eq(80)
    end

    it "doesn't decrease health below 0" do
      robot.wound(150)
      robot.health.should eq(0)
    end
  end

  describe "#heal" do
    it "increases health" do
      robot.wound(40)
      robot.heal(20)
      robot.health.should eq(80)
    end

    it "doesn't increase health over 100" do
      robot.heal(10)
      robot.health.should eq(100)
    end
  end

  describe "#attack" do
    it "wounds other robot with weak default attack (5 hitpoints)" do
      robot2 = Robot.new

      # Create an expectation that by the end of this test,
      # the second robot will have had #wound method called on it
      # and 5 (the default attack hitpoints) will be passed into that method call
      robot2.should_receive(:wound).with(5)

      # This is what will trigger the wound to happen on robot2
      robot.attack(robot2)
    end
  end
end
