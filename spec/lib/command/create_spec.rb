RSpec.describe Create do

  let(:create) { Create.new(command) }

  describe "#valid?" do
    context "with valid parameters" do
      let(:command) { "I 5 5" }

      it "returns true and assigns values" do
        expect(create).to be_valid
        expect(create.result).to eq({ n: 5, m: 5 })
      end
    end

    context "with invalid parameters" do
      let(:command) { "I 0 5" }

      before do
        expect(create).to be_invalid
      end

      it "adds error" do
        expect(create.errors).to include("Given values must be between 1 and 250.")
      end

      it "result is empty" do
        expect(create.result).to be_empty
      end
    end
  end

end
