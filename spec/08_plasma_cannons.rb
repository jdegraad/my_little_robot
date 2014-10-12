require './spec_helper'

describe PlasmaCannon do
  subject(:plasma_cannon) { PlasmaCannon.new }

  it { should be_an(Weapon) }

  its(:name) { should eq("Plasma Cannon") }
  its(:weight) { should eq(200) }
  its(:damage) { should eq(55) }
end
