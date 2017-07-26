RSpec.describe Command do

  describe "#known?" do
    ["I", "C", "L", "V", "H", "S"].each do |letter|
      it "returns true when given line matches letter #{letter}" do
        expect(Command.new(letter).known?).to be true
      end
    end

    ["i", "x", "l", "v", "h", "s", "Ö", "1", 2, "_"].each do |letter|
      it "returns false when given line '#{letter}' doesn't matches" do
        expect(Command.new(letter).known?).to be false
      end
    end
  end

  describe "#call" do
    context "create" do
      it "executes when given command matches" do
        expect { Command.new("I 5 5").call }.to_not raise_error
      end

      it "raises exception when given command doesn't match" do
        expect { Command.new("I 5 0").call }.to raise_error(RuntimeError)
        expect { Command.new("i 5 5").call }.to raise_error(RuntimeError)
        expect { Command.new("A 5 5").call }.to raise_error(RuntimeError)
        expect { Command.new("I 5 251").call }.to raise_error(RuntimeError)
        expect { Command.new("I 0 250").call }.to raise_error(RuntimeError)
      end
    end

    context "clear" do
      it "executes when given command matches" do
        expect { Command.new("C ", Bitmap.new(cols: 5, rows: 5)).call }.to_not raise_error
        expect { Command.new("C", Bitmap.new(cols: 5, rows: 5)).call }.to_not raise_error
      end

      it "raises exception when given command doesn't match" do
        expect { Command.new("c", Bitmap.new(cols: 5, rows: 5)).call }.to raise_error(RuntimeError)
        expect { Command.new("C 123").call }.to raise_error(RuntimeError)
      end
    end

    context "colors" do
      it "excutes when given command matches" do
        expect { Command.new("L 5 5 W", Bitmap.new(cols: 5, rows: 5)).call }.to_not raise_error
        expect { Command.new("L 1 250 O", Bitmap.new(cols: 5, rows: 250)).call }.to_not raise_error
      end

      it "raises exception when given command doesn't match" do
        expect { Command.new("l 5 5 W", Bitmap.new(cols: 5, rows: 5)).call }.to raise_error(RuntimeError)
        expect { Command.new("L 0 250 O", Bitmap.new(cols: 5, rows: 250)).call }.to raise_error(RuntimeError)
        expect { Command.new("L 1 250 0", Bitmap.new(cols: 5, rows: 250)).call }.to raise_error(RuntimeError)
        expect { Command.new("L 1 250 O", Bitmap.new(cols: 5, rows: 5)).call }.to raise_error(RuntimeError)
      end
    end

    context "fill" do
      it "excutes when given command matches" do
        expect { Command.new("F 5 5 W", Bitmap.new(cols: 5, rows: 5)).call }.to_not raise_error
        expect { Command.new("F 1 250 O", Bitmap.new(cols: 5, rows: 250)).call }.to_not raise_error
      end

      it "raises exception when given command doesn't match" do
        expect { Command.new("f 5 5 W", Bitmap.new(cols: 5, rows: 5)).call }.to raise_error(RuntimeError)
        expect { Command.new("F 0 250 O", Bitmap.new(cols: 5, rows: 250)).call }.to raise_error(RuntimeError)
        expect { Command.new("F 1 250 0", Bitmap.new(cols: 5, rows: 250)).call }.to raise_error(RuntimeError)
        expect { Command.new("F 1 250 O", Bitmap.new(cols: 5, rows: 5)).call }.to raise_error(RuntimeError)
      end
    end

    context "vertical line" do
      let(:bitmap) { Bitmap.new(cols: 5, rows: 250) }
      it "executes when given command matches" do
        expect { Command.new("V 5 5 15 W", Bitmap.new(cols: 5, rows: 15)).call }.to_not raise_error
        expect { Command.new("V 1 5 250 O", bitmap).call }.to_not raise_error
      end

      it "raises exception when given command doesn't match" do
        expect { Command.new("V 5 5 0 W", bitmap).call }.to raise_error(RuntimeError)
        expect { Command.new("V 1 5 251 O", bitmap).call }.to raise_error(RuntimeError)
        expect { Command.new("V 0 5 251 O", bitmap).call }.to raise_error(RuntimeError)
        expect { Command.new("V 1 5 25 0", bitmap).call }.to raise_error(RuntimeError)
      end
    end

    context "horizontal line" do
      it "executes when given command matches" do
        expect { Command.new("H 5 5 15 W", Bitmap.new(cols: 5, rows: 15)).call }.to_not raise_error
        expect { Command.new("H 1 5 250 O", Bitmap.new(cols: 5, rows: 250)).call }.to_not raise_error
      end

      it "returns false when given command doesn't match" do
        expect { Command.new("H 5 0 15 W").call }.to raise_error(RuntimeError)
        expect { Command.new("H 1 250 251 O").call }.to raise_error(RuntimeError)
        expect { Command.new("H 0 5 250 O").call }.to raise_error(RuntimeError)
      end
    end

    context "show" do
      it "executes when given command matches" do
        expect { Command.new("S ", Bitmap.new(cols: 1, rows: 1)).call }.to_not raise_error
        expect { Command.new("S", Bitmap.new(cols: 1, rows: 1)).call }.to_not raise_error
      end

      it "raises exception when given command doesn't match" do
        expect { Command.new("c ", Bitmap.new(cols: 1, rows: 1)).call }.to raise_error(RuntimeError)
        expect { Command.new("S 123").call }.to raise_error(RuntimeError)
      end
    end
  end
end