RSpec.describe Clear do

  let(:bitmap) { Bitmap.new(rows: 5, cols: 5) }
  let(:command) { Command.new("C", bitmap) }

  describe "#call" do
    it "resets bitmap colors" do
      expect(bitmap).to receive(:reset!)
      Clear.new(command).call
    end
  end
end
