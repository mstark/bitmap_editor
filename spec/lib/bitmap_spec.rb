RSpec.describe Bitmap do
  describe ".new" do
    it "creates bitmap with given dimensions" do
      expect(
        Bitmap.new(cols: 5, rows: 5).draw
      ).to eq("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n")
    end
  end

  describe "set_pixel_color" do
    let(:bitmap) { Bitmap.new(cols: 1, rows: 2) }
    before do
      bitmap.set_pixel_color(x: 1, y: 2, color: "W")
    end

    it "changes given pixel to given color" do
      expect(bitmap.draw).to eq("O\nW\n")
    end
  end

  describe "draw_vertical_line" do
    let(:bitmap) { Bitmap.new(cols: 1, rows: 5) }

    context "y values in order" do
      before do
        bitmap.draw_vertical_line(x: 1, from: 2, to: 4, color: "B")
      end

      it "draws vertical line with given params" do
        expect(bitmap.draw).to eq("O\nB\nB\nB\nO\n")
      end
    end

    context "y values in reverse order" do
      before do
        bitmap.draw_vertical_line(x: 1, from: 4, to: 2, color: "B")
      end

      it "draws vertical line with given params" do
        expect(bitmap.draw).to eq("O\nB\nB\nB\nO\n")
      end
    end
  end

  describe "draw_horizontal_line" do
    let(:bitmap) { Bitmap.new(cols: 5, rows: 2) }

    context "x values in order" do
      before do
        bitmap.draw_horizontal_line(y: 2, from: 2, to: 4, color: "B")
      end

      it "draws horizontal line with given params" do
        expect(bitmap.draw).to eq("OOOOO\nOBBBO\n")
      end
    end

    context "x values in reverse order" do
      before do
        bitmap.draw_horizontal_line(y: 2, from: 4, to: 2, color: "B")
      end

      it "draws horizontal line with given params" do
        expect(bitmap.draw).to eq("OOOOO\nOBBBO\n")
      end
    end
  end

  describe "reset!" do
    let(:bitmap) { Bitmap.new(cols: 5, rows: 1) }
    before do
      bitmap.set_pixel_color(x: 3, y: 1, color: "B")
    end

    it "resets bitmap to background color" do
      expect(bitmap.draw).to eq("OOBOO\n")
      bitmap.reset!
      expect(bitmap.draw).to eq("OOOOO\n")
    end
  end
end
