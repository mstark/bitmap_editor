class Base
  attr_reader :m, :command, :bitmap

  RANGE = (1..250)
  COLOR = ("A".."Z")

  def errors
    @errors || []
  end

  def result
    @result || {}
  end

  def invalid?
    !valid?
  end

  private

  def valid_color?
    COLOR.include?(color)
  end
end
