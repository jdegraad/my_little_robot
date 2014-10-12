require './spec_helper'

describe BoxOfBolts do
  subject(:bolts) { BoxOfBolts.new }

  it { should be_an(Item) }

  its(:name) { should eq("Box of bolts") }
  its(:weight) { should eq(25) }

  describe "#feed" do
    it "heals the robot's health 20pts" do
      robot = Robot.new
      robot.should_receive(:heal).with(20)
      bolts.feed(robot)
    end
  end
end
