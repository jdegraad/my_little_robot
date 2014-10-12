class Weapon < Item

  attr_accessor :name, :weight, :damage

  DEFAULT_RANGE = 1
  
  def initialize(name, weight, damage, range = DEFAULT_RANGE)
    super(name, weight)
    @damage = damage
    @range = range
  end

  def hit(robot) 
    robot.wound(damage)
  end

end
