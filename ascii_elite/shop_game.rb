# encoding: utf-8
#
PLANETS = {
  'Lave' => { :food_price => 1.3, :minerals_price => 8.5},
  'Zaonce' => { :food_price => 2.1, :minerals_price => 5.3},
}

class ShopGame
  def initialize(width, height, planet_name)
    @width = width
    @height = height
    @planet_name = planet_name
    @planet = PLANETS[@planet_name]

    @options = {
      :buy_food      => "Buy food       #{@planet[:food_price] - 0.1}",
      :sell_food     => "Sell food      #{@planet[:food_price]}",
      :buy_minerals  => "Buy minerals   #{@planet[:minerals_price] - 0.1}",
      :sell_minerals => "Sell minerals  #{@planet[:minerals_price]}",
      :_             => " ",
      :go_to_warp    => "Leave",
    }
    @menu = Menu.new(@options.values)
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

  def selection
    @options.keys[@menu.selection].to_s
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
    #:go_to_dock_game
  end

  def move_right
    selection
  end

  def objects
    @menu.objects
  end

  def finish
  end

  def textbox_content
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
