class Color
  attr_reader :m, :command, :bitmap

  def initialize(command, bitmap)
    @command = command
    @bitmap = bitmap
    @errors = nil
    matches
  end

  def valid?
    if in_bitmap_boundary? && in_range? && Command::COLOR.include?(color)
      @result = { x: x, y: y, color: color }
      true
    else
      @errors = { errors: [] }
      false
    end
  end

  def errors
    @errors || []
  end

  def result
    @result || {}
  end

  private

  def in_range?
    Command::RANGE.include?(x) && Command::RANGE.include?(y)
  end

  def in_bitmap_boundary?
    x <= bitmap.max_x && y <= bitmap.max_y
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
