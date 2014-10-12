require './spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  describe "#equipped_weapon" do
    its(:equipped_weapon) { should eq(nil) }

    it "sets equipped weapon" do
      weapon = Laser.new

      robot.equipped_weapon = weapon
      robot.equipped_weapon.should eq(weapon)
    end
  end

  describe "#attack" do
    let(:robot2) { Robot.new }
    let(:weapon) { PlasmaCannon.new }

    it "uses the equipped weapon in attack" do
      robot.equipped_weapon = weapon

      weapon.should_receive(:hit).with(robot2)
      robot.attack(robot2)
    end
  end
end
