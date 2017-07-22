RSpec.describe Color do

  describe "#valid?" do
    context "with valid parameters" do
      let(:command) { "L 5 5 W" }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 5) }
      let(:color) { Color.new(command, bitmap) }

      it "returns true and assigns values" do
        expect(color).to be_valid
        expect(color.result).to eq({ x: 5, y: 5, color: "W" })
      end
    end

    context "with invalid parameters" do
      let(:command) { "L 0 5 0" }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 5) }
      let(:color) { Color.new(command, bitmap) }

      before do
        expect(color).to be_invalid
      end

      it "adds boundary error" do
        expect(color.errors).to include("Given x/y values are not within in the bitmap!")
      end

      it "adds invalid color error" do
        expect(color.errors).to include("Given color is invalid!")
      end

      it "result is empty" do
        expect(color.result).to be_empty
      end
    end
  end

end
