require_relative "command"
require_relative "null_bitmap"
require_relative "bitmap"

class BitmapEditor

  def initialize
    @bitmap = NullBitmap.new
  end

  def run(file)
    if file.nil? || !File.exist?(file) || File.directory?(file)
      return puts "please provide correct file"
    end

    execute(file)
  end

  private

  def execute(file)
    File.open(file).each do |line|
      line = line.chomp

      command = Command.new(line, @bitmap)
      command.call
      # preserve bitmap
      @bitmap = command.bitmap
    end
  rescue => e
    puts e.message
    puts e.backtrace if ENV["DEBUG_BITMAP_EDITOR"]
  end
end
