class SpaceShipInWarp
  attr_accessor :x, :y, :texture

  def initialize(x,y)
    @x, @y = x, y
    @texture = File.read('warp.txt').split("\n")
  end
end