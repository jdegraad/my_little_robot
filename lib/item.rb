class Item

  attr_accessor :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

end


class Battery < Item

  def initialize
    super("Battery", 5)
  end

  def recharge(robot)
    robot.shield = 50
  end

end