require_relative "line"

# Command: H X1 X2 Y C
# Draws horizontal line in row Y,
# from column X1 to/including X2,
# with color C
class HorizontalLine < Line

  def call
    super
    bitmap.draw_horizontal_line(y: y, from: from, to: to, color: color)
  end

  private

  def matches
    @m = line.split(" ", 5)
  end

  def range_parameters?
    in_bitmap_boundary? && RANGE.include?(y) && in_range?
  end

  def in_bitmap_boundary?
    y <= bitmap.max_y && to <= bitmap.max_x && from <= bitmap.max_x
  end

  def from
    m && m[1] ? m[1].to_i : 0
  end

  def to
    m && m[2] ? m[2].to_i : 0
  end

  def y
    m && m[3] ? m[3].to_i : 0
  end
end
