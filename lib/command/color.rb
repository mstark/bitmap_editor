require_relative "base"

# Command: L X Y C
# Sets Bitmap to color C,
# at position X,Y
class Color < Base

  def initialize(command)
    @command = command
  end

  def call
    matches

    unless in_bitmap_boundary?
      raise("Given values are not within in the bitmap!")
    end

    raise("Given color is invalid!") unless valid_color?

    command.bitmap.set_pixel_color(x: x, y: y, color: color)
  end

  private

  def in_range?
    RANGE.include?(x) && RANGE.include?(y)
  end

  def in_bitmap_boundary?
    in_range? && x <= command.bitmap.max_x && y <= command.bitmap.max_y
  end

  def matches
    @m = command.line.split(" ", 4)
  end

  def x
    m && m[1] ? m[1].to_i : 0
  end

  def y
    m && m[2] ? m[2].to_i : 0
  end

  def color
    m && m[3] ? m[3] : ""
  end
end
