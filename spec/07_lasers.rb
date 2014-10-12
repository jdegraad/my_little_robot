require './spec_helper'

describe Laser do
  subject(:laser) { Laser.new }

  it { should be_an(Weapon) }

  its(:name) { should eq("Laser") }
  its(:weight) { should eq(125) }
  its(:damage) { should eq(25) }
end
