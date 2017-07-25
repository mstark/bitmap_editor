require_relative "command/create"
require_relative "command/color"
require_relative "command/vertical_line"
require_relative "command/horizontal_line"
require_relative "command/unknown"
require_relative "command/clear"
require_relative "command/show"

class Command
  attr_reader :line
  attr_accessor :bitmap

  def initialize(line, bitmap = NullBitmap.new)
    @line = line.to_s
    @bitmap = bitmap
  end

  def call
    if known?
      klazz.new(self).call
    else
      Unknown.new(self).call
    end
  end

  def known?
    line.start_with?("I", "C", "L", "V", "H", "S")
  end

  private

  def klazz
    Object.const_get(commands[line[0]])
  end

  def commands
    {
      "I" => "Create",
      "C" => "Clear",
      "L" => "Color",
      "V" => "VerticalLine",
      "H" => "HorizontalLine",
      "S" => "Show"
    }
  end
end
