class Bitmap
  MAX_WIDTH = 250
  MAX_HEIGHT = 250
  DEFAULT_COLOUR = 'O'.freeze

  attr_reader :height, :width, :image

  def initialize(height, width)
    @height = height
    @width = width
    validate_dimensions
    build_bitmap_image
  end

  def clear
    build_bitmap_image
  end

  private

  def build_bitmap_image
    @image = Array.new(height) { Array.new(width) { DEFAULT_COLOUR } }
  end

  def validate_dimensions
    raise "Image size must be between #{MAX_HEIGHT} x #{MAX_WIDTH} pixels" unless valid_dimensions?
  end

  def valid_dimensions?
    height.positive? && height < MAX_HEIGHT && width.positive? && width < MAX_WIDTH
  end
end
