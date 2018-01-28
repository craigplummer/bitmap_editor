require_relative '../../spec_helper'
require_relative '../../../lib/commands/colour_pixel_command'

RSpec.describe ColourPixelCommand do
  subject { described_class.new(*args) }
  let(:bitmap) { Bitmap.new(5, 5) }

  describe '#perform' do
    context 'with valid attributes' do
      let(:args) { [2, 5, 'P', bitmap] }
      let(:expected_image) do
        [
          %w[O O O O O],
          %w[O O O O O],
          %w[O O O O O],
          %w[O O O O O],
          %w[O P O O O]
        ]
      end

      it 'should colour the correct pixel within the bitmap' do
        subject.perform
        expect(bitmap.image).to eq(expected_image)
      end
    end

    context 'with invalid attributes' do
      context 'with pixel outside of bitmap bounds' do
        let(:args) { [2, 9, 'P', bitmap] }

        it 'should raise an exception' do
          expect do
            subject.perform
          end.to raise_error(RuntimeError, /You can't draw outside of bitmap/)
        end
      end

      context 'with invalid colour' do
        let(:args) { [2, 4, 'PP', bitmap] }

        it 'should raise an exception' do
          expect { subject.perform }.to raise_error(RuntimeError, /Invalid colour value specified/)
        end
      end
    end
  end
end
