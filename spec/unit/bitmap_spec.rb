require_relative '../spec_helper'
require_relative '../../lib/bitmap'

RSpec.describe Bitmap do
  subject { described_class.new(x, y) }

  context 'with valid arguments' do
    let(:x) { 3 }
    let(:y) { 5 }
    let(:expected_image) do
      [
        %w[O O O O O],
        %w[O O O O O],
        %w[O O O O O]
      ]
    end

    it 'should generate new bitmap image of correct size' do
      expect(subject.image).to eq(expected_image)
    end
  end
end
