require 'forwardable'

class Base
  extend Forwardable

  attr_reader :m, :command
  delegate [:line, :bitmap] => :@command

  RANGE = (1..250)
  COLOR = ("A".."Z")

  private

  def valid_color?
    COLOR.include?(color)
  end
end
