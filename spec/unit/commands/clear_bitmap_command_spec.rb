# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../lib/commands/clear_bitmap_command'

RSpec.describe ClearBitmapCommand do
  subject { described_class.new(*args) }

  describe '#perform' do
    let(:bitmap) { Bitmap.new(2, 4) }
    let(:args) { [bitmap] }
    let(:expected_image) do
      [
        %w[O O O O],
        %w[O O O O]
      ]
    end
    
    it 'should reset the bitmap back O' do
      expect(bitmap).to receive(:clear).and_call_original
      expect(bitmap.image).to eq(expected_image)
      subject.perform
    end
  end
end
