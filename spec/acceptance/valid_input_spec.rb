require_relative '../../lib/bitmap_editor.rb'
require 'pry'

RSpec.describe 'Valid Input Examples' do
  subject { BitmapEditor.new(file).run }

  context 'with I and S command' do
    let(:file) { './spec/fixtures/files/valid_files/I_S.txt' }
    let(:expected_result) do
      <<~OUTPUT
        OOOOO
        OOOOO
        OOOOO
        OOOOO
      OUTPUT
    end

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end

  context 'with I L S commands' do
    let(:file) { './spec/fixtures/files/valid_files/I_L_S.txt' }
    let(:expected_result) do
      <<~OUTPUT
        OOOOO
        OOXOO
        OOOOO
        OOOOO
      OUTPUT
    end

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end

  context 'with I V S commands' do
    let(:file) { './spec/fixtures/files/valid_files/I_V_S.txt' }

    let(:expected_result) do
      <<~OUTPUT
        OOOOO
        OOXOO
        OOXOO
        OOXOO
      OUTPUT
    end

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end

  context 'with I H S commands' do
    let(:file) { './spec/fixtures/files/valid_files/I_H_S.txt' }

    let(:expected_result) do
      <<~OUTPUT
        OOOOO
        XXXXX
        OOOOO
        OOOOO
      OUTPUT
    end

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end

  context 'with I V C H S commands' do
    let(:file) { './spec/fixtures/files/valid_files/I_V_C_H_S.txt' }

    let(:expected_result) do
      <<~OUTPUT
        OOOOO
        OOOOO
        XXXXX
        OOOOO
      OUTPUT
    end

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end

  context 'with I V H S commands' do
    let(:file) { './spec/fixtures/files/valid_files/I_V_H_S.txt' }

    let(:expected_result) do
      <<~OUTPUT
        OOVOO
        HHHHH
        OOVOO
        OOVOO
      OUTPUT
    end

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end

  context 'with I V H L S commands' do
    let(:file) { './spec/fixtures/files/valid_files/I_V_H_L_S.txt' }

    let(:expected_result) do
      <<~OUTPUT
        OOVOO
        HHHHH
        OOVOO
        OOLOO
      OUTPUT
    end

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end

  context 'with S called twice - I V S H S' do
    let(:file) { './spec/fixtures/files/valid_files/I_V_S_H_S.txt' }

    let(:expected_result) do
      <<~OUTPUT
        OOVOO
        OOVOO
        OOVOO
        OOVOO
        OOVOO
        HHHHH
        OOVOO
        OOVOO
      OUTPUT
    end

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end
end
