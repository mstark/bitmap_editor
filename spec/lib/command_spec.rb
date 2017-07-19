RSpec.describe Command do

  describe "#create?" do
    it "returns true when given command matches" do
      expect(Command.new("I 5 5").create?).to be true
    end

    it "returns false when given command doesn't match" do
      expect(Command.new("I 5 0").create?).to be false
      expect(Command.new("i 5 5").create?).to be false
      expect(Command.new("A 5 5").create?).to be false
      expect(Command.new("I 5 251").create?).to be false
      expect(Command.new("I 0 250").create?).to be false
    end
  end

  describe "#clear?" do
    it "returns true when given command matches" do
      expect(Command.new("C ").clear?).to be true
      expect(Command.new("C").clear?).to be true
    end

    it "returns false when given command doesn't match" do
      expect(Command.new("c").clear?).to be false
      expect(Command.new("C 123").clear?).to be false
    end
  end

  describe "#colors?" do
    it "returns true when given command matches" do
      expect(Command.new("L 5 5 W").colors?).to be true
      expect(Command.new("L 1 250 O").colors?).to be true
    end

    it "returns false when given command doesn't match" do
      expect(Command.new("l 5 5 W").colors?).to be false
      expect(Command.new("L 0 250 O").colors?).to be false
      expect(Command.new("L 1 250 0").colors?).to be false
    end
  end

  describe "#vertical?" do
    it "returns true when given command matches" do
      expect(Command.new("V 5 5 15 W").vertical?).to be true
      expect(Command.new("V 1 5 250 O").vertical?).to be true
    end

    it "returns false when given command doesn't match" do
      expect(Command.new("V 5 5 0 W").vertical?).to be false
      expect(Command.new("V 1 5 251 O").vertical?).to be false
      expect(Command.new("V 0 5 251 O").vertical?).to be false
      expect(Command.new("V 1 5 25 0").vertical?).to be false
    end
  end

  describe "#horizontal?" do
    it "returns true when given command matches" do
      expect(Command.new("H 5 5 15 W").horizontal?).to be true
      expect(Command.new("H 1 5 250 O").horizontal?).to be true
    end

    it "returns false when given command doesn't match" do
      expect(Command.new("H 5 0 15 W").horizontal?).to be false
      expect(Command.new("H 1 250 251 O").horizontal?).to be false
      expect(Command.new("H 0 5 250 O").horizontal?).to be false
    end
  end

  describe "#show?" do
    it "returns true when given command matches" do
      expect(Command.new("S ").show?).to be true
      expect(Command.new("S").show?).to be true
    end

    it "returns false when given command doesn't match" do
      expect(Command.new("c ").show?).to be false
      expect(Command.new("S 123").show?).to be false
    end
  end
end