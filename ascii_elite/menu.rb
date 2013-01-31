class Menu
  def initialize(options)
    @options = options
    @selection = 1
  end

  def move(direction)
    case direction
    when :top
      @selection -= 1 unless @selection < 2
    when :down
      @selection += 1 unless @selection > @options.size - 1
    end
  end

  def objects
    array = []; x = 0; y = 0;

    # Rener options
    @options.each do |option|
      x = 4
      y += 1
      option.each_char do |c|
        x += 1
        array << Char.new(x, y, c)
      end
    end

    # Render selector
    array << Char.new(2, @selection, 'X')

    array
  end

  def selection
    @selection
  end
end

