require_relative '../spec_helper'
require_relative '../../lib/file_parser.rb'

RSpec.describe FileParser do
  subject { described_class.new(file) }

  context 'with no file provided' do
    let(:file) { nil }

    it 'should raise exception' do
      expect{subject.perform}.to raise_error(/File could not be found/)
    end
  end

  context 'with invalid file extension' do
    let(:file) { './spec/fixtures/files/invalid_file.json' }

    it 'should raise exception' do
      expect{subject.perform}.to raise_error(/Unsupported file type provided/)
    end
  end

  context 'with valid file extension and file' do
    let(:file) { './spec/fixtures/files/valid_file.txt' }
    let(:expected_result) do
      [
        {'I' => ['5', '6']},
        {'L' => ['1', '3', 'A']},
        {'V' => ['2', '3', '6', 'W']},
        {'H' => ['3', '5', '2', 'Z']},
        {'S' => []}
      ]
    end

    it 'should return a list of commands' do
      expect(subject.perform).to eq(expected_result)
    end
  end

  context 'with text file with invalid starting command' do
    let(:file) { './spec/fixtures/files/invalid_starting_command.txt' }

    it 'raises an exception' do
      expect{subject.perform}.to raise_error(RuntimeError, /First command must be I/)
    end
  end

  context 'with text file containing unknown command letter' do
    let(:file) { './spec/fixtures/files/unknown_command.txt' }

    it 'raises an exception' do
      expect{subject.perform}.to raise_error(RuntimeError, /Unknown command specified/)
    end
  end
end