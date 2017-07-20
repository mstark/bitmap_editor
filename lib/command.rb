require_relative "command/create"
require_relative "command/color"

class Command
  attr_reader :command, :bitmap
  RANGE = (1..250)
  COLOR = ("A".."Z")

  def initialize(command, bitmap = nil)
    @command = command
    @bitmap = bitmap
    @result = nil
  end

  def unknown?
    !command.start_with?("I", "C", "L", "A", "V", "H", "S")
  end

  # I M N
  def create?
    create = Create.new(command)

    if create.valid?
      @result = create.result
    else
      @errors = create.errors
    end

    create.errors.empty?
  end

  # C
  def clear?
    command.strip == "C"
  end

  # L X Y C
  def colors?
    color = Color.new(command, bitmap)

    if color.valid?
      @result = color.result
    else
      @errors = color.errors
    end

    color.errors.empty?
  end

  # V X Y1 Y2 C
  def vertical?
    m = /\A(V)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command)

    x = m && m[2] ? m[2].to_i : 0
    y1 = m && m[3] ? m[3].to_i : 0
    y2 = m && m[4] ? m[4].to_i : 0
    color = m && m[5] ? m[5] : ""

    if RANGE.include?(x) && RANGE.include?(y1) && RANGE.include?(y2) && COLOR.include?(color)
      @result = { command: :vertical, x: x, y1: y1, y2: y2, color: color }
      true
    else
      @result = { errors: "" }
      false
    end
  end

  # H X1 X2 Y C
  def horizontal?
    m = /\A(H)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command)

    x1 = m && m[2] ? m[2].to_i : 0
    x2 = m && m[3] ? m[3].to_i : 0
    y = m && m[4] ? m[4].to_i : 0
    color = m && m[5] ? m[5] : ""

    if RANGE.include?(y) && RANGE.include?(x1) && RANGE.include?(x2) && COLOR.include?(color)
      @result = { command: :horizontal, x1: x1, x2: x2, y: y, color: color }
      true
    else
      @result = { errors: "" }
      false
    end
  end

  def show?
    command.strip == "S"
  end

  def params
    @result
  end
end
