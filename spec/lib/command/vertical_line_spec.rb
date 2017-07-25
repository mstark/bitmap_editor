RSpec.describe VerticalLine do

  describe "#call" do
    context "with valid parameters" do
      let(:command) { Command.new("V 5 5 15 W", bitmap) }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 15) }
      let(:line) { VerticalLine.new(command) }

      it "assigns values to bitmap" do
        expect(bitmap).to receive(:draw_vertical_line).with({ x: 5, from: 5, to: 15, color: "W" })
        line.call
      end
    end

    context "with invalid parameters" do
      let(:command_invalid_boundary) { Command.new("V 5 5 15 W", bitmap) }
      let(:command_invalid_color) { Command.new("V 5 5 15 0", bitmap) }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 5) }

      it "adds boundary error" do
        expect {
          VerticalLine.new(command_invalid_boundary).call
        }.to raise_error(RuntimeError, "Given values are not within in the bitmap!")
      end

      it "adds invalid color error" do
        expect {
          VerticalLine.new(command_invalid_color).call
        }.to raise_error(RuntimeError, "Given color is invalid!")
      end
    end
  end
end
