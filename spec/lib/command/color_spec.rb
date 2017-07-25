RSpec.describe Color do

  let(:bitmap) { Bitmap.new(cols: 5, rows: 5) }

  describe "#call" do
    context "with valid parameters" do
      let(:command) { Command.new("L 5 5 W", bitmap) }

      it "assigns given values" do
        expect(bitmap).to receive(:set_pixel_color).with({ x: 5, y: 5, color: "W" })
        Color.new(command).call
      end
    end

    context "with invalid parameters" do
      let(:command_invalid_boundary) { Command.new("L 0 5 N", bitmap) }
      let(:command_invalid_color) { Command.new("L 1 5 0", bitmap) }

      it "raises boundary exception" do
        expect {
          Color.new(command_invalid_boundary).call
        }.to raise_error(RuntimeError, "Given values are not within in the bitmap!")
      end

      it "raises invalid color error" do
        expect {
          Color.new(command_invalid_color).call
        }.to raise_error(RuntimeError, "Given color is invalid!")
      end
    end
  end
end
