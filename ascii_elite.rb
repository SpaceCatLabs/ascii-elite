# encoding: utf-8

require "bundler/setup"
require "gaminator"

class AsciiElite
  class Player < Struct.new(:x, :y)
    def char
      "@"
    end

    def color
      Curses::COLOR_RED
    end

    def move(x, y)
      self.x += x
      self.y += y
    end
  end

  def initialize(width, height)
    @width = width
    @height = height
    @player = Player.new(5,5)
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
    @player.move(0, -1)
  end

  def move_down
    @player.move(0, 1)
  end

  def objects
    [@player]
  end

  def finish
    exit
  end

  def textbox_content
    "textbox"
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
