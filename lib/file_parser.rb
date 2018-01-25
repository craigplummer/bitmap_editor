
class FileParser
  SUPPORTED_FILE_TYPES = ['.txt']

  attr_reader :file, :file_extension

  def initialize(file)
    @file = file
    validate_file_existance
    @file_extension = File.extname(file)
    validate_file_extension
  end

  def perform
    []
  end

  private

  def validate_file_existance
    raise 'File could not be found' if file.nil? || !File.exist?(file)
  end

  def validate_file_extension
    raise 'Unsupported file type provided' unless SUPPORTED_FILE_TYPES.include?(file_extension)
  end
end