class SpaceBase
  attr_accessor :x, :y, :texture

  def initialize(x,y)
    @x, @y = x, y
    @texture = File.read('base.txt').split("\n")
  end
end