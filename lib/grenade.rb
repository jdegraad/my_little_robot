class Grenade < Weapon

  attr_reader :range

  GRENADE_RANGE = 2

  def initialize(range = GRENADE_RANGE)
    super("Grenade", 40, 15, range)
    @range = range
  end

end
