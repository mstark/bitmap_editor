require_relative "line"

class HorizontalLine < Line

  def valid?
    @errors.push("Given color is invalid!") unless valid_color?

    unless range_parameters?
      @errors.push("Given values are not within in the bitmap!")
    end

    if @errors.empty?
      @result = { x1: from, x2: to, y: y, color: color }
      true
    else
      false
    end
  end

  private

  def matches
    @m = /\A(H)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command)
  end

  def range_parameters?
    in_bitmap_boundary? && RANGE.include?(y) && in_range?
  end

  def in_bitmap_boundary?
    y <= bitmap.max_y && to <= bitmap.max_x && from <= bitmap.max_x
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
