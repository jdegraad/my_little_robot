require './spec_helper'

describe Weapon do
  subject(:weapon) { Weapon.new("power_shock", 10, 45) }

  it { should be_an(Item) }

  its(:name) { should eq("power_shock") }
  its(:weight) { should eq(10) }
  its(:damage) { should eq(45) }

  describe "#hit" do
    let(:robot) { double("robot") }

    it "hurts robot" do
      robot.should_receive(:wound).with(45)
      weapon.hit(robot)
    end
  end
end
