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
    let(:commands) { [] }

    it 'should return a list of commands' do
      expect(subject.perform).to eq(commands)
    end
  end
end