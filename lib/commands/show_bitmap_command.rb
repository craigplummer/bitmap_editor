# frozen_string_literal: true
require_relative 'colour_pixel_command'

class ShowBitmapCommand < BaseCommand
  attr_reader :bitmap

  def initialize(*args)
    validate_command(0, *args)
    @bitmap = args[0]
  end

  def perform
    bitmap.image.each { |row| puts row.join }
    bitmap
  end
end
