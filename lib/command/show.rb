# Command: C
#  Shows the Bitmap
#
# - ignores all input in line following capital S
class Show < Base

  def initialize(command)
    @command = command
  end

  def call
    puts bitmap.draw
  end
end