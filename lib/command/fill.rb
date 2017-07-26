require_relative "base"

# Command: F X Y C
# Fills Bitmap with color C,
# starting position X,Y
# - stops at other colors (not O)
# and edges
class Fill < Base
  def initialize(command)
    @command = command
  end

  def call
    matches

    unless in_bitmap_boundary?
      raise("Given values are not within in the bitmap! (in: #{line})")
    end

    raise("Given color is invalid! (in: #{line})") unless valid_color?

    fill_bitmap(x, y)
  end

  private

  def fill_bitmap(next_x, next_y)
    return unless valid_to_fill?(next_x, next_y)

    bitmap.set_pixel_color(x: next_x, y: next_y, color: color)
    # filling pixel around
    fill_bitmap(next_x, next_y + 1)
    fill_bitmap(next_x, next_y - 1)
    fill_bitmap(next_x + 1, next_y)
    fill_bitmap(next_x - 1, next_y)
  end

  def valid_to_fill?(next_x, next_y)
    in_range_to_fill?(next_x, next_y) && !bitmap.any_color_at?(x: next_x, y: next_y)
  end

  def in_range_to_fill?(next_x, next_y)
    (RANGE.min..bitmap.max_x).include?(next_x) && (RANGE.min..bitmap.max_y).include?(next_y)
  end

  def in_range?
    RANGE.include?(x) && RANGE.include?(y)
  end

  def in_bitmap_boundary?
    in_range? && x <= bitmap.max_x && y <= bitmap.max_y
  end

  def matches
    @m = line.split(" ", 4)
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
