# Command: C
#  Shows the Bitmap
#
# - ignores all input in line following capital S
class Show
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def call
    puts command.bitmap.draw
  end
end