require_relative "base"
class Line < Base

  def initialize(command)
    @command = command
  end

  def call
    matches

    raise("Given color is invalid! (in: #{line})") unless valid_color?
    raise("Given values are not within in the bitmap! (in: #{line})") unless range_parameters?
  end

  private

  def in_range?
    RANGE.include?(from) && RANGE.include?(to)
  end

  def color
    m && m[4] ? m[4] : ""
  end
end
