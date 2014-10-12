require './spec_helper'

# The robot can move around in two dimensional space.
# We can use an array to keep track of its X and Y position, which will
# by default start at 0, 0

describe Robot do

  # Since we are describing a Robot class,
  # all the nested descriptions here are referring to the robot.

  # sets the variable robot to be a new robot.
  subject(:robot) { Robot.new }

  # The pound symbol is a convention to imply that position is a callable method
  # This test is basically saying that it expects robot.position == [0, 0]
  describe "#position" do
    its(:position) { should eq ([0, 0]) }
  end

  # Now let's describe some of the movement methods on the Robot
  describe "move methods" do

    # It's important to read the contents of the test to see what it's testing for
    # Btw: an "it" is a test. The string "moves left" is just a description of what is being tested.
    it "moves left" do
      robot.move_left
      robot.position.should eq([-1, 0])

      robot.move_left
      robot.position.should eq([-2, 0])
    end

    it "moves right" do
      robot.move_right
      robot.position.should eq([1, 0])

      robot.move_right
      robot.position.should eq([2, 0])
    end

    it "moves up" do
      robot.move_up
      robot.position.should eq([0, 1])

      robot.move_up
      robot.position.should eq([0, 2])
    end

    it "moves down" do
      robot.move_down
      robot.position.should eq([0, -1])

      robot.move_down
      robot.position.should eq([0, -2])
    end
  end
end
