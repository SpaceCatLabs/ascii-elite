class WarpGame
  def initialize(width, height)
    @width = width
    @height = height
    @spaceship = SpaceShipInWarp.new(10,3)
  end

  def wait?
    false
  end

  def tick
    move_ship
    return :go_to_dock_game if finished?
  end

  def move_ship
    @spaceship.x = @spaceship.x + 1
  end

  def objects
    [@spaceship]
  end

  def finished?
    @spaceship.x > 60
  end

  def textbox_content
    # counter.to_s
  end

  def exit
  end

  def exit_message
    "exit"
  end

  def sleep_time
    0.05
  end

end
