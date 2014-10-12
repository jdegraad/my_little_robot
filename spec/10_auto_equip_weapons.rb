require './spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  let(:weapon)     { PlasmaCannon.new }
  let(:non_weapon) { BoxOfBolts.new }

  # Recall that since it is using a "#" in the description,
  # we are describing/expecting a pick_up instance method
  describe "#pick_up" do
    it "should automatically equip item if it's a weapon of any kind" do
      robot.pick_up(weapon)
      robot.equipped_weapon.should eq(weapon)
    end
    it "should not equip the item as a weapon if it's not a weapon (duh!)" do
      robot.pick_up(non_weapon)
      robot.equipped_weapon.should be_nil
    end
  end

end
