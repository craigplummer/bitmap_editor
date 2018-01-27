class Bitmap
  attr_reader :x, :y, :image

  def initialize(x, y)
    @x = x
    @y = y
    @image = build_bitmap_image
  end

  def build_bitmap_image
    Array.new(x) { Array.new(y) {'O'} }
  end
end