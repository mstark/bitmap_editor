RSpec.describe BitmapEditor do
  include FileHelper

  Dir["spec/support/examples/input/*.txt"].each do |path|
    describe "bin/bitmap_editor" do
      it "#{path}" do
        expect(
          %x[bin/bitmap_editor #{path}]
        ).to eq output_file(path)
      end
    end

    describe "#run" do
      it "#{path}" do
        expect {
          BitmapEditor.new.run(path)
        }.to output(output_file(path)).to_stdout
      end
    end
  end
end
