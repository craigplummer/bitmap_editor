require_relative '../bitmap'

class BuildBitmapCommand
  attr_reader :x, :y

  def initialize(*args)
    @x = args[0].to_i
    @y = args[1].to_i
  end

  def perform
    Bitmap.new(x, y)
  end
end