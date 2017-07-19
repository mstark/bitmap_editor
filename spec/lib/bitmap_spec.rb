RSpec.describe Bitmap do
  describe ".new" do
    it "creates bitmap with given dimensions" do
      expect(
        Bitmap.new(cols: 5, rows: 5).draw
      ).to eq("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n")
    end
  end
end
