class IntroGame
  def initialize(width, height)
    @width = width
    @height = height
    @logo = Logo.new(1,1)
  end

  def wait?
    true
  end

  def tick
  end

  def objects
    [@logo]
  end

  def finish
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

  def tick
  end

  def move_left; :go_to_warp; end
  def move_right; :go_to_warp; end
  def move_top; :go_to_warp; end
  def move_down; :go_to_warp; end

end
