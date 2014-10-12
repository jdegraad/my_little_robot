require './spec_helper'

# The Robot class should keep track of all robots that are instantiated.

describe Robot do
  subject(:robot) { Robot.new }

  describe "robot list" do

    it "should store and then list all the robots in the game" do
      expect(Robot::list).to start_with []
    end

  

  end

end
