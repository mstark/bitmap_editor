require_relative "line"

class HorizontalLine < Line
  def valid?
    if Command::RANGE.include?(y) && in_range? && color?
      @result = { x1: from, x2: to, y: y, color: color }
      true
    else
      @errors = { errors: [] }
      false
    end
  end

  private

  def matches
    @m = /\A(H)\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}(\d{1,3})\s{1}([A-Z]{1})\z/.match(command)
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
