RSpec.describe Create do

  let(:create) { Create.new(command) }

  describe "#call" do
    context "with valid parameters" do
      let(:command) { Command.new("I 5 5") }

      it "creates new bitmap with given values" do
        expect(Bitmap).to receive(:new).with({ cols: 5, rows: 5 })
        create.call
      end
    end

    context "with invalid parameters" do
      let(:command) { Command.new("I 0 5") }

      it "adds error" do
        expect {
          create.call
        }.to raise_error(RuntimeError, "Given values must be between 1 and 250.")
      end
    end
  end
end
