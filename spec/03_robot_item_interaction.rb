require './spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  # let is similar to subject. Here we are creating two variables
  # item1 and item2
  let(:item1) { Item.new("item1", 10) }
  let(:item2) { Item.new("item2", 30) }

  # Another two variables
  let(:light_item) { Item.new("light item", 1) }
  let(:max_weight_item) { Item.new("max weight item", 250) }

  describe "#items" do
    its(:items) { should eq([]) }
  end

  # Recall that since it is using a "#" in the description,
  # we are describing/expecting a pick_up instance method
  describe "#pick_up" do
    it "adds item to items" do
      # add item1 to collection of items, and make sure it's there when we call #items
      robot.pick_up(item1)
      robot.items.should include(item1)

      # add item2 to collection of items, and make sure it's there when we call #items
      robot.pick_up(item2)
      robot.items.should include(item2)
    end
  end

  describe "#items_weight" do
    its(:items_weight) { should eq(0) }

    it "should report back total weight of items that have been picked up" do
      robot.pick_up(item1)
      robot.pick_up(item2)

      robot.items_weight.should eq(40)
    end
  end

  describe "capacity" do
    it "can only carry a maximum of 250 lbs" do
      robot.pick_up(max_weight_item).should eq(true)
      robot.pick_up(light_item).should eq(false)
      robot.items_weight.should eq(250)
    end
  end
end
