require 'forwardable'
require_relative "command"
require_relative "bitmap"

class BitmapEditor
  extend Forwardable
  attr_reader :command
  def_delegators :command, :unknown?, :show?, :create?, :clear?,
           :colors?, :vertical?, :horizontal?, :params

  def initialize
    @bitmap = nil
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exist?(file)

    File.open(file).each do |line|
      line = line.chomp
      @command = Command.new(line, @bitmap)

      if unknown?
        puts 'unrecognised command :('
        break
      end

      create if create?

      if !create? && @bitmap
        if show?
          puts @bitmap.draw
        else
          edit
        end
      end

    end
  end

  private

  def create
    @bitmap = Bitmap.new(cols: params[:n], rows: params[:m])
  end

  def edit
    if clear?
      @bitmap.reset!
    elsif colors?
      @bitmap.set_pixel_color(x: params[:x], y: params[:y], color: params[:color])
    elsif vertical?
      @bitmap.draw_vertical_line(x: params[:x], from: params[:y1], to: params[:y2], color: params[:color])
    elsif horizontal?
      @bitmap.draw_horizontal_line(y: params[:y], from: params[:x1], to: params[:x2], color: params[:color])
    end
  end
end
