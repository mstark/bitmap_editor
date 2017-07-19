require_relative "command"
require_relative "bitmap"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exist?(file)
    @bitmap = nil
    File.open(file).each do |line|
      line = line.chomp
      command = Command.new(line)

      if command.create?
        params = command.parameters
        @bitmap = Bitmap.new(cols: params[:n], rows: params[:m])
        next
      elsif @bitmap
        if command.show?
          puts @bitmap.draw
        elsif command.clear?
          @bitmap.reset!
        elsif command.colors?
          params = command.parameters
          @bitmap.set_pixel_color(x: params[:x], y: params[:y], color: params[:color])
        elsif command.vertical?
          params = command.parameters
          @bitmap.draw_vertical_line(x: params[:x], y1: params[:y1], y2: params[:y2], color: params[:color])
        elsif command.horizontal?
          params = command.parameters
          @bitmap.draw_horizontal_line(y: params[:y], x1: params[:x1], x2: params[:x2], color: params[:color])
        end
      else
        puts 'unrecognised command :('
      end

      # case line
      # when 'S'
      #     puts "There is no image"
      # else
      #     puts 'unrecognised command :('
      # end
    end
  end
end
