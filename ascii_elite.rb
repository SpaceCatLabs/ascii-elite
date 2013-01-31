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

    @inventory = {}
    @credits = 100

    @planet_name = 'Lave'
    @planet = PLANETS[@planet_name]

    @game_state = :shop
    @game = ShopGame.new(@width, @height, @planet_name)
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
   "Credits: #{@credits.to_f.round(2)}"
  end

  def exit
    @game.exit
  end

  def exit_message
    @exit_message
  end

  def update_game_state(action)
    return unless action

    case action.to_s.to_sym
    when :go_to_dock_game
      @game = DockGame.new(@width, @height)
    when :docked
      @game = ShopGame.new(@width, @height)
    when :dead
      @exit_message = 'You are dead ;('
      Kernel.exit
    when :buy_minerals
      buy(:minerals)
    when :buy_food
      buy(:food)
    when :sell_minerals
      sell(:sell_minerals)
    when :sell_food
      sell(:sell_food)
    end
  end

  def buy(product)
    price = @planet["buy_#{product}"]
    @credits -= 1
  end

  def sell(product)
    price = @planet["sell_#{product}"]
    @credits += 1
  end

end

Gaminator::Runner.new(AsciiElite).run
