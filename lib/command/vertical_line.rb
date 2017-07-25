require_relative "line"

# Command: V X Y1 Y2 C
# Draws vertical line in column X,
# from row Y1 to/including Y2,
# with color C
class VerticalLine < Line

  def call
    super
    bitmap.draw_vertical_line(x: x, from: from, to: to, color: color)
  end

  private

  def matches
    @m = line.split(" ", 5)
  end

  def range_parameters?
    in_bitmap_boundary? && RANGE.include?(x) && in_range?
  end

  def in_bitmap_boundary?
    x <= bitmap.max_x && to <= bitmap.max_y && from <= bitmap.max_y
  end

  def from
    m && m[2] ? m[2].to_i : 0
  end

  def to
    m && m[3] ? m[3].to_i : 0
  end

  def x
    m && m[1] ? m[1].to_i : 0
  end
end