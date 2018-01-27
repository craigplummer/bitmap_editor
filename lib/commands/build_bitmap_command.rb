require_relative '../bitmap'

class BuildBitmapCommand
  attr_reader :x, :y

  MAX_WIDTH = 250
  MAX_HEIGHT = 250

  def initialize(*args)
    @x = args[0].to_i
    @y = args[1].to_i
  end

  def perform
    validate_dimensions
    Bitmap.new(x, y)
  end

  def validate_dimensions
    raise 'Image size must be between 250 x 250 pixels' unless valid_dimensions?
  end

  def valid_dimensions?
    x.positive? && x < MAX_HEIGHT && y.positive? && y < MAX_WIDTH
  end
end