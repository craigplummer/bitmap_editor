class Bitmap
  MAX_WIDTH = 250
  MAX_HEIGHT = 250
  DEFAULT_COLOUR = 'O'

  attr_reader :x, :y, :image

  def initialize(x, y)
    @x = x
    @y = y
    validate_dimensions
    @image = build_bitmap_image
  end

  private

  def build_bitmap_image
    Array.new(x) { Array.new(y) { DEFAULT_COLOUR } }
  end

  def validate_dimensions
    raise "Image size must be between #{MAX_HEIGHT} x #{MAX_WIDTH} pixels" unless valid_dimensions?
  end

  def valid_dimensions?
    x.positive? && x < MAX_HEIGHT && y.positive? && y < MAX_WIDTH
  end
end