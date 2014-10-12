require_relative 'robot'
require_relative 'item'
require_relative 'weapon'
require_relative 'box_of_bolts'
require_relative 'laser'
require_relative 'plasma_cannon'
require_relative 'grenade'

class Robot

  attr_accessor :items, :health, :position, :equipped_weapon, :shield, :list

  @@list = []

  def initialize
    @position = [0, 0] # these are x and y coordinates
    @items = []
    @health = 100
    @shield = 50
    @@list << self
    # @equipped_weapon = nil # we don't need this if we have an accessor...?
  end

# Robot Methods

  def self.list
    @@list
  end

  def self.find(x, y)
    @@list.select { |robot| robot.position[0] == x && robot.position[1] == y}

    # @@list.each do |robot|
    #   return robot if robot.position[0] == x && robot.position[1] == y
    # end
  end

# Movement

  def move_up
    @position[1] += 1 # target position[1] in the array for the y-coordinate
  end

  def move_down
    @position[1] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_left
    @position[0] -= 1
  end

# Interactions

  def scan
    # It should look for x+1,y -> x-1, y -> x, y+1 -> x, y-1
    west = self.position[0] - 1
    east = self.position[0] + 1
    north = self.position[1] + 1
    south = self.position[1] - 1

    a = Robot.find(@position[0], north) 
    b = Robot.find(@position[0], south) 
    c = Robot.find(east, @position[1]) 
    d = Robot.find(west, @position[1])
    
    results = []
    results << a if a != []
    results << b if b != []
    results << c if c != []
    results << d if d != []
    results
    
  end

  def pick_up(item)
    return false if self.items_weight + item.weight > 250
    @items << item
    @equipped_weapon = item if item.is_a? Weapon
    # Two checks: is health at 80? Is item == bolts?
    item.feed(self) if item.is_a?(BoxOfBolts) && self.health <= 80
    true
  end


  def attack(robot) 
    # Check coordinates of the enemy robot. Let's call a new method
    # If range is 2 and robot has a grenade...

    @equipped_weapon.hit(robot) if in_range?(robot) == true && @equipped_weapon.is_a?(Grenade)

    if in_range?(robot) == true
    @equipped_weapon.hit(robot) if @equipped_weapon != nil # can also be written as if self.equipped_weapon
    robot.wound(5)
    end

    @equipped_weapon = nil if @equipped_weapon.is_a?(Grenade)

  end

  def in_range?(robot)
    # So x can be +/- 1 and y must be same, or y can be +/- 1 and x must be the same
    x_range = robot.position[0] - @position[0]
    y_range = robot.position[1] - @position[1]
    if x_range.abs == 1 && @position[1] == robot.position[1]
      return true
    elsif y_range.abs == 1 && @position[0] == robot.position[0]  
      return true
      # OK, let's account for grenades now...
    elsif y_range.abs == 2 && @position[0] == robot.position[0]
      return true
    elsif x_range.abs == 2 && @position[1] == robot.position[1]
      return true
    elsif robot.position[0] == @position[0] && robot.position[1] == @position[1]
      return true
    else
      return false
    end
  end

  def attack!(robot)
    if !robot.is_a? Robot
      raise UnattackableError, "You can't attack that!"
    end
    equipped_weapon.hit(robot) if equipped_weapon != nil
    robot.wound(5)
  end

  def items_weight
    self.items.inject(0) { |sum, i| sum += i.weight }
  end

  def heal!(hp)
    if self.health <= 0
      raise RobotAlreadyDeadError, "Hey, you're dead!" 
    end
    @health += hp
    @health = 100 if self.health > 100
  end


# Status Effects

  def wound(dmg)
    if @shield > 0
      @shield -= dmg
      if @shield < 0
        excess_dmg = @shield
        @health -= excess_dmg
        @shield = 0
      end
    else
      @health -= dmg
      if @health < 0
        @health = 0
      end
    end
  end

  def heal(hp)
    @health += hp
    @health = 100 if self.health > 100
  end

end

# Custom Exceptions

class RobotAlreadyDeadError < StandardError
end

class UnattackableError < StandardError
end



