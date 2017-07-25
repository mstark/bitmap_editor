# require 'forwardable'
require_relative "command"
require_relative "null_bitmap"
require_relative "bitmap"

class BitmapEditor
  # extend Forwardable
  # attr_reader :command
  # def_delegators :command, :unknown?, :known?, :show?, :create?, :clear?,
  #          :colors?, :vertical?, :horizontal?, :params

  def initialize
    @bitmap = NullBitmap.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exist?(file)

    File.open(file).each do |line|
      line = line.chomp

      command = Command.new(line, @bitmap)
      command.call
      # preserve bitmap
      @bitmap = command.bitmap
    end
  rescue => e
    puts e.message
  end
end
