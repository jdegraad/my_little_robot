require './spec_helper'

describe Robot do
  subject(:robot) { Robot.new }
  let(:item) { Item.new("an_item", 10) }

  describe "#attack!" do
    it "should not allow robots to attack non-robots and raise exception" do
      expect { robot.attack!(item) }.to raise_error UnattackableError
    end
  end

end