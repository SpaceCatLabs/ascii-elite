# encoding: utf-8

require "bundler/setup"
require "gaminator"
load "space_base.rb"

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
    @player = Player.new(5,19)
    @base = SpaceBase.new(90,0)
    @won = false
  end

  def move_base
    @base.y = @base.y + rand(-1..1) unless @won
  end

  def move_player
    @player.x = @player.x + 1
  end

  def increase_counter

  end

  def wait?
    true
  end

  def locked?
    if @player.y == (@base.y + 10) && @player.x >= 50
      @won = true
      puts "Locked to dock!"
    end
  end

  def docked?
    exit if @player.x >= 90
  end


  def tick
    move_player
    move_base
    increase_counter
    locked?
    docked?
  end

  def input_map
    {
      ?w => :move_top,
      ?s => :move_down,
    }
  end

  def move_top
    @player.move(0, -1) unless @won
  end

  def move_down
    @player.move(0, 1) unless @won
  end

  def objects
    [@player, @base]
  end

  def finish
    exit
  end

  def textbox_content
    # counter.to_s
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
