# encoding: utf-8

require "bundler/setup"
require "gaminator"


require_relative "ascii_elite/char"
require_relative "ascii_elite/menu"

class AsciiElite
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
  end

  def move_down
    @menu.move(:down)
  end

  def move_left
    finish
  end

  def move_right
    finish
  end

  def objects
    @menu.objects
  end

  def finish
    Kernel.exit
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

Gaminator::Runner.new(AsciiElite).run
