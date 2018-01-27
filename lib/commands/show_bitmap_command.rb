class ShowBitmapCommand
  attr_reader :bitmap
  
  def initialize(*args)
    @bitmap = args[0]
  end

  def perform
    bitmap.image.each { |row| puts row.join }
  end
end