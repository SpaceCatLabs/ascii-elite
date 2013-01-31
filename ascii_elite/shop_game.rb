# encoding: utf-8

class ShopGame
  def initialize(width, height)
    @width = width
    @height = height

    @menu = Menu.new(['1. Buy stuff', '2. Leave the space station'])
  end

  def wait?
    true
  end

  def tick
  end

  def input_map
    {
      ?w => :move_top,
      ?s => :move_down,
    }
  end

  def move_top
    @menu.move(:top)
    nil
  end

  def move_down
    @menu.move(:down)
    nil
  end

  def move_left
    :go_to_dock_game
  end

  def move_right
    :go_to_dock_game
  end

  def objects
    @menu.objects
  end

  def finish
  end

  def textbox_content
    @selection.to_s
  end

  def exit
    Kernel.exit
  end

  def exit_message
    "exit"
  end

  def sleep_time
    0.05
  end

end
