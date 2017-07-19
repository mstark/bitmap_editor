RSpec.describe BitmapEditor do
  include FileHelper

  Dir["spec/support/examples/input/*.txt"].each do |path|
    it "#{path}" do
      expect(
        %x[bin/bitmap_editor #{path}]
      ).to eq output_file(path)
    end
  end
end
