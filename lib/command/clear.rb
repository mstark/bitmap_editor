# Command: C
# Clears all color from the Bitmap
#
# - ignores all input in line following capital C
class Clear < Base

  def initialize(command)
    @command = command
  end

  def call
    bitmap.reset!
  end
end
