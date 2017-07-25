class Base
  attr_reader :m, :command

  RANGE = (1..250)
  COLOR = ("A".."Z")

  private

  def valid_color?
    COLOR.include?(color)
  end
end
