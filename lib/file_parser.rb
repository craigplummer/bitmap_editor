require_relative 'file_parsers/text_file_parser'

class FileParser
  FILE_PARSERS = {
    '.txt' => TextFileParser
  }.freeze

  attr_reader :file, :file_extension

  def initialize(file)
    @file = file
    validate_file_existance
    @file_extension = File.extname(file)
    validate_file_extension
  end

  def perform
    file_parser.new(file).perform
  end

  private

  def file_parser
    FILE_PARSERS[file_extension]
  end

  def validate_file_existance
    raise 'File could not be found' if file.nil? || !File.exist?(file)
  end

  def validate_file_extension
    raise 'Unsupported file type provided' if FILE_PARSERS[file_extension].nil?
  end
end