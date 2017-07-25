RSpec.describe NullBitmap do
  let(:null_bitmap) { NullBitmap.new }

  describe "public methods" do
    [:draw, :max_x, :max_y, :reset!].each do |method|
      it "raises no bitmap exception when calling ##{method.to_s}" do
        expect {
          null_bitmap.public_send(method)
        }.to raise_error(RuntimeError, "Please create a bitmap first!")
      end
    end
  end
end
