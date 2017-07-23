RSpec.describe VerticalLine do

  describe "#valid?" do
    context "with valid parameters" do
      let(:command) { "V 5 5 15 W" }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 15) }
      let(:line) { VerticalLine.new(command, bitmap) }

      it "returns true and assigns values" do
        expect(line).to be_valid
        expect(line.result).to eq({ x: 5, y1: 5, y2: 15, color: "W" })
      end
    end

    context "with invalid parameters" do
      let(:command) { "V 5 5 15 0" }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 5) }
      let(:line) { VerticalLine.new(command, bitmap) }

      before do
        expect(line).to be_invalid
      end

      it "adds boundary error" do
        expect(line.errors).to include("Given values are not within in the bitmap!")
      end

      it "adds invalid color error" do
        expect(line.errors).to include("Given color is invalid!")
      end

      it "result is empty" do
        expect(line.result).to be_empty
      end
    end
  end

end
