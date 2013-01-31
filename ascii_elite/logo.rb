class Logo
  attr_accessor :x, :y, :texture

  def initialize(x,y)
    @x, @y = x, y
    @texture = File.read('logo.txt').split("\n")
  end
end