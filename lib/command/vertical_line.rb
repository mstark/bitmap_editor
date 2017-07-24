require_relative "line"

class VerticalLine < Line

  def valid?
    @errors.push("Given color is invalid!") unless valid_color?

    unless range_parameters?
      @errors.push("Given values are not within in the bitmap!")
    end

    if @errors.empty?
      @result = { x: x, y1: from, y2: to, color: color }
      true
    else
      false
    end
  end

  private

  def matches
    @m = /\A(V)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command)
  end

  def range_parameters?
    in_bitmap_boundary? && RANGE.include?(x) && in_range?
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