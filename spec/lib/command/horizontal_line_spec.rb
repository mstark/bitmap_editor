RSpec.describe HorizontalLine do

  describe "#valid?" do
    context "with valid parameters" do
      let(:command) { "H 5 15 5 W" }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 15) }
      let(:line) { HorizontalLine.new(command, bitmap) }

      it "returns true and assigns values" do
        expect(line).to be_valid
        expect(line.result).to eq({ y: 5, x1: 5, x2: 15, color: "W" })
      end
    end

    context "with invalid parameters" do
      let(:command) { "H 5 15 5 0" }
      let(:bitmap) { Bitmap.new(cols: 5, rows: 5) }
      let(:line) { HorizontalLine.new(command, bitmap) }

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
