require_relative "base"

# Command: I M N
# Creates bitmap with dimension M,N
class Create < Base

  def initialize(command)
    @command = command
    matches
  end

  def call
    raise("Given values must be between 1 and 250.") unless in_range?
    command.bitmap = Bitmap.new(cols: cols, rows: rows)
  end

  private

  def in_range?
    RANGE.include?(cols) && RANGE.include?(rows)
  end

  def matches
    @m = command.line.split(" ", 3)
  end

  def cols
    m && m[1] ? m[1].to_i : 0
  end

  def rows
    m && m[2] ? m[2].to_i : 0
  end
end
