require_relative "base"

class Color < Base

  def initialize(command, bitmap)
    @command = command
    @bitmap = bitmap
    @errors = []
    matches
  end

  def valid?
    unless in_bitmap_boundary?
      @errors.push("Given x/y values are not within in the bitmap!")
    end

    @errors.push("Given color is invalid!") unless valid_color?

    if @errors.empty?
      @result = { x: x, y: y, color: color }
      true
    else
      false
    end
  end

  private

  def in_range?
    RANGE.include?(x) && RANGE.include?(y)
  end

  def in_bitmap_boundary?
    in_range? && x <= bitmap.max_x && y <= bitmap.max_y
  end

  def matches
    @m = /\A(L)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command)
  end

  def x
    m && m[2] ? m[2].to_i : 0
  end

  def y
    m && m[3] ? m[3].to_i : 0
  end

  def color
    m && m[4] ? m[4] : ""
  end
end
