# encoding: utf-8

require "bundler/setup"
require "gaminator"
load "space_base.rb"

require_relative "ascii_elite/char"
require_relative "ascii_elite/menu"
require_relative "ascii_elite/shop_game"
require_relative "ascii_elite/dock_game"

load "space_base.rb"

class AsciiElite
  def initialize(width, height)
    @width = width
    @height = height
    @exit_message = ''

    @game_state = :shop
    @game = ShopGame.new(@width, @height)
  end

  def input_map
    {
      ?w => :move_top,
      ?s => :move_down,
      ?a => :move_left,
      ?d => :move_right,
    }
  end

  #
  # All methods below are delegated to @gmae
  #
  def wait?
    @game.wait?
  end

  def sleep_time
    @game.sleep_time
  end

  def tick
    @game.tick
    update_game_state(@game.tick)
  end

  def move_top
    update_game_state(@game.move_top) if @game.respond_to? :move_top
  end

  def move_down
    update_game_state(@game.move_down) if @game.respond_to? :move_down
  end

  def move_left
    update_game_state(@game.move_left) if @game.respond_to? :move_left
  end

  def move_right
    update_game_state(@game.move_right) if @game.respond_to? :move_right
  end

  def objects
    @game.objects
  end

  def finish
    @game.finish
  end

  def textbox_content
    @game.textbox_content
  end

  def exit
    @game.exit
  end

  def exit_message
    @exit_message
  end

  def update_game_state(action)
    case action
    when :go_to_dock_game
      @game = DockGame.new(@width, @height)
    when :docked
      @game = ShopGame.new(@width, @height)
    when :dead
      @exit_message = 'You are dead ;('
      Kernel.exit
    end
  end

end

Gaminator::Runner.new(AsciiElite).run
