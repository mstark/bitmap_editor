class Bitmap
  attr_reader :dimensions, :colors
  BASE_COLOR = "O"

  def initialize(cols:, rows:)
    Struct.new("Dimensions", :rows, :cols)
    @dimensions = Struct::Dimensions.new(rows, cols)
    @colors = {}
  end

  def draw
    bitmap = ""
    dimensions.rows.times do |x|
      row = ""
      dimensions.cols.times do |y|
        pos = [x + 1, y + 1].join("-")
        row += colors[pos] ? colors[pos] : BASE_COLOR
      end
      bitmap += row + "\n"
    end
    bitmap
  end

  def reset!
    @colors = {}
  end

  def set_pixel_color(x:, y:, color:)
    colors[[x, y].join("-")] = color
  end

  def draw_vertical_line(x:, y1:, y2:, color:)
    (y1..y2).each do |y|
      set_pixel_color(x: x, y: y, color: color)
    end
  end

  def draw_horizontal_line(y:, x1:, x2:, color:)
    (x1..x2).each do |x|
      set_pixel_color(x: x, y: y, color: color)
    end
  end
end
