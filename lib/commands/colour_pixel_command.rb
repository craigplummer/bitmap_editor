class ColourPixelCommand
  attr_reader :x, :y, :colour, :bitmap

  def initialize(*args)
    @x = args[0].to_i - 1
    @y = args[1].to_i - 1
    @colour = args[2]
    @bitmap = args[3]
  end

  def perform
    validate_attributes
    bitmap.image[x][y] = colour
    bitmap
  end

  def validate_attributes
    validate_coordinates
    validate_colour
  end

  def validate_coordinates
    raise 'You can\'t draw outside of bitmap' unless valid_coordinates?
  end

  def valid_coordinates?
    x < bitmap.height && x.positive? && y < bitmap.width && y.positive?
  end

  def validate_colour
    raise 'Invalid colour value specified' unless colour =~ /\A[A-Z]\z/
  end
end