require_relative "line"

class VerticalLine < Line
  def valid?
    if in_bitmap_boundary? && Command::RANGE.include?(x) && in_range? && color?
      @result = { x: x, y1: from, y2: to, color: color }
      true
    else
      @errors = { errors: [] }
      false
    end
  end

  private

  def matches
    @m = /\A(V)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command)
  end

  def in_bitmap_boundary?
    x <= bitmap.max_x && to <= bitmap.max_y && from <= bitmap.max_y
  end

  def from
    m && m[3] ? m[3].to_i : 0
  end

  def to
    m && m[4] ? m[4].to_i : 0
  end

  def x
    m && m[2] ? m[2].to_i : 0
  end
end