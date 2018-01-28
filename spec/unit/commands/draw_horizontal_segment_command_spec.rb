# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../lib/commands/draw_horizontal_segment_command'
require_relative '../../../lib/bitmap'
require 'pry'

RSpec.describe DrawHorizontalSegmentCommand do
  subject { described_class.new(*args) }
  let(:bitmap) { Bitmap.new(5, 5) }

  describe '#perform' do
    context 'with valid arguments' do
      let(:args) { [1, 3, 5, 'P', bitmap] }
      let(:expected_image) do
        [
          %w[O O O O O],
          %w[O O O O O],
          %w[O O O O O],
          %w[O O O O O],
          %w[P P P O O]
        ]
      end

      it 'should colour the correct horizontal segment within the bitmap' do
        subject.perform
        expect(bitmap.image).to eq(expected_image)
      end
    end

    context 'with invalid attributes' do
      context 'with pixel outside of bitmap bounds' do
        let(:args) { [1, 3, 9, 'P', bitmap] }

        it 'should raise an exception' do
          expect do
            subject.perform
          end.to raise_error(RuntimeError, /You can't draw outside of bitmap/)
        end
      end

      context 'with x1 greater than x2' do
        let(:args) { [5, 3, 2, 'P', bitmap] }

        it 'should raise an exception' do
          expect { subject.perform }.to raise_error(RuntimeError, /X1 needs to be lower than X2/)
        end
      end

      context 'with invalid colour' do
        let(:args) { [2, 3, 4, 'PP', bitmap] }

        it 'should raise an exception' do
          expect { subject.perform }.to raise_error(RuntimeError, /Invalid colour value specified/)
        end
      end
    end
  end
end
