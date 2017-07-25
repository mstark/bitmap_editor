require_relative "line"

# Command: H X1 X2 Y C
# Draws horizontal line in row Y,
# from column X1 to/including X2,
# with color C
class HorizontalLine < Line

  def call
    super
    command.bitmap.draw_horizontal_line(y: y, from: from, to: to, color: color)
  end

  private

  def matches
    @m = /\A(H)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command.line)
  end

  def range_parameters?
    in_bitmap_boundary? && RANGE.include?(y) && in_range?
  end

  def in_bitmap_boundary?
    y <= command.bitmap.max_y && to <= command.bitmap.max_x && from <= command.bitmap.max_x
  end

  def from
    m && m[2] ? m[2].to_i : 0
  end

  def to
    m && m[3] ? m[3].to_i : 0
  end

  def y
    m && m[4] ? m[4].to_i : 0
  end
end
