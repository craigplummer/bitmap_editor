class ShowBitmapCommand
  attr_reader :bitmap

  def initialize(*args)
    @bitmap = args[0]
    validate_command(*args)
  end

  def perform
    bitmap.image.each { |row| puts row.join }
    bitmap
  end

  def validate_command(*args)
    raise 'Too many arguments provided for command' unless args.count - 1 == 0
  end
end