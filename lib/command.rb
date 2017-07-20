require_relative "command/create"
require_relative "command/color"
require_relative "command/vertical_line"
require_relative "command/horizontal_line"

class Command
  attr_reader :command, :bitmap
  RANGE = (1..250)
  COLOR = ("A".."Z")

  def initialize(command, bitmap = NullBitmap.new)
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
    line = VerticalLine.new(command, bitmap)
    if line.valid?
      @result = line.result
    else
      @errors = line.errors
    end

    line.errors.empty?
  end

  # H X1 X2 Y C
  def horizontal?
    line = HorizontalLine.new(command, bitmap)
    if line.valid?
      @result = line.result
    else
      @errors = line.errors
    end

    line.errors.empty?
  end

  def show?
    command.strip == "S"
  end

  def params
    @result
  end
end
