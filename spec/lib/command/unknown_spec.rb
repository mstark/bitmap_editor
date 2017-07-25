RSpec.describe Unknown do

  let(:command) { Command.new("test test") }

  describe "#call" do
    it "raises exception" do
      expect {
        Unknown.new(command).call
      }.to raise_error(RuntimeError, "Unrecognised command: #{command.line} :(")
    end
  end
end
