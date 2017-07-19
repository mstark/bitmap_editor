class Command
  attr_reader :command
  RANGE = (1..250)
  COLOR = ("A".."Z")

  def initialize(command)
    @matches = nil
    @command = command
    @params = nil
  end

  # I M N
  def create?
    m = /\A(I)\s{1}(\d{1,3})\s{1}(\d{1,3})\z/.match(command)

    cols = m && m[2] ? m[2].to_i : 0
    rows = m && m[3] ? m[3].to_i : 0

    if RANGE.include?(cols) && RANGE.include?(rows)
      @result = { command: :create, n: cols, m: rows }
      true
    else
      @result = { errors: "" }
      false
    end
  end

  # C
  def clear?
    command.strip == "C"
  end

  # L X Y C
  def colors?
    m = /\A(L)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command)

    x = m && m[2] ? m[2].to_i : 0
    y = m && m[3] ? m[3].to_i : 0
    color = m && m[4] ? m[4] : ""

    if RANGE.include?(x) && RANGE.include?(y) && COLOR.include?(color)
      @result = { command: :color, x: x, y: x, color: color }
      true
    else
      @result = { errors: "" }
      false
    end
  end

  # V X Y1 Y2 C
  def vertical?
  end

  # H X1 X2 Y C
  def horizontal?
  end

  def show?
    command.strip == "S"
  end

  def parameters
  end
end
