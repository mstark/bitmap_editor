RSpec.describe HorizontalLine do

  describe "#call" do
    context "with valid parameters" do
      let(:command) { Command.new("H 5 15 5 W", bitmap) }
      let(:bitmap) { Bitmap.new(cols: 15, rows: 5) }
      let(:line) { HorizontalLine.new(command) }

      it "assigns values to bitmap" do
        expect(bitmap).to receive(:draw_horizontal_line).with({ y: 5, from: 5, to: 15, color: "W" })
        line.call
      end
    end

    context "with invalid parameters" do
      let(:command_invalid_boundary) { Command.new("H 5 15 5 W", bitmap) }
      let(:command_invalid_color) { Command.new("H 5 15 5 0", bitmap) }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 5) }

      it "adds boundary error" do
        expect {
          HorizontalLine.new(command_invalid_boundary).call
        }.to raise_error(RuntimeError, "Given values are not within in the bitmap! (in: H 5 15 5 W)")
      end

      it "adds invalid color error" do
        expect {
          HorizontalLine.new(command_invalid_color).call
        }.to raise_error(RuntimeError, "Given color is invalid! (in: H 5 15 5 0)")
      end
    end
  end
end
