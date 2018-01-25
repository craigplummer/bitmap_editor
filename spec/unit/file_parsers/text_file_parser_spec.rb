require_relative '../../../lib/file_parsers/text_file_parser.rb'
require_relative '../../spec_helper'

RSpec.describe TextFileParser do
  subject { described_class.new(file) }

  context 'with valid text file' do
    let(:file) { './spec/fixtures/files/valid_file.txt' }
    let(:expected_result) do
      [
        {'I' => ['5, 6']},
        {'L' => ['1, 3, A']},
        {'V' => ['2, 3, 6, W']},
        {'H' => ['3, 5, 2, Z']},
        {'S' => []}
      ]
    end

    it 'parses the file and returns a list of commands and their arguments' do
      expect(subject.perform).to eq(expected_result)
    end
  end
end