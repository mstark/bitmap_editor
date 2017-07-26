RSpec.describe Fill do

  let(:bitmap) { Bitmap.new(cols: 5, rows: 5) }

  describe "#call" do
    context "with valid parameters" do
      let(:command) { Command.new("F 5 5 W", bitmap) }

      it "assigns given color" do
        expect(bitmap).to receive(:set_pixel_color).exactly(5 * 5).times
        Fill.new(command).call
      end
    end

    context "with invalid parameters" do
      let(:command_invalid_boundary) { Command.new("F 0 5 N", bitmap) }
      let(:command_invalid_color) { Command.new("F 1 5 0", bitmap) }

      it "raises boundary exception" do
        expect {
          Fill.new(command_invalid_boundary).call
        }.to raise_error(RuntimeError, "Given values are not within in the bitmap! (in: F 0 5 N)")
      end

      it "raises invalid color error" do
        expect {
          Fill.new(command_invalid_color).call
        }.to raise_error(RuntimeError, "Given color is invalid! (in: F 1 5 0)")
      end
    end
  end
end
