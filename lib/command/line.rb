require_relative "base"
class Line < Base

  def initialize(command)
    @command = command
    @bitmap = command.bitmap
  end

  def call
    matches

    raise("Given color is invalid!") unless valid_color?
    raise("Given values are not within in the bitmap!") unless range_parameters?
  end

  private

  def in_range?
    RANGE.include?(from) && RANGE.include?(to)
  end

  def color
    m && m[4] ? m[4] : ""
  end
end
