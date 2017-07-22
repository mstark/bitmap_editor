require_relative "base"
class Line < Base

  def initialize(command, bitmap)
    @command = command
    @bitmap = bitmap
    @errors = nil
    matches
  end

  private

  def in_range?
    RANGE.include?(from) && RANGE.include?(to)
  end

  def color
    m && m[5] ? m[5] : ""
  end

end