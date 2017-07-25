RSpec.describe Show do

  let(:bitmap) { Bitmap.new(rows: 1, cols: 1) }
  let(:command) { Command.new("S", bitmap) }

  describe "#call" do
    it "renders bitmap" do
      expect(bitmap).to receive(:draw)
      Show.new(command).call
    end
  end
end
