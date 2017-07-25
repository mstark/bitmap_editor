# Command: C
# Clears all color from the Bitmap
#
# - ignores all input in line following capital C
class Clear
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def call
    command.bitmap.reset!
  end
end