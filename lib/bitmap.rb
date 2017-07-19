class Bitmap
  attr_reader :dimensions, :colors
  Dimensions = Struct.new(:rows, :cols)

  def initialize(cols:, rows:, base_color: "O")
    @dimensions = Dimensions.new(rows, cols)
    @colors = {}
    @base_color = base_color
  end

  def draw
    bitmap = ""
    dimensions.rows.times do |y|
      row = ""
      dimensions.cols.times do |x|
        pos = [x + 1, y + 1].join("-")
        row += colors.has_key?(pos) ? colors[pos] : @base_color
      end
      bitmap += row + "\n"
    end
    bitmap
  end

  def reset!
    colors.clear
  end

  def set_pixel_color(x:, y:, color:)
    colors.store([x, y].join("-"), color)
  end

  def draw_vertical_line(x:, y1:, y2:, color:)
    y1, y2 = y2, y1 if y2 < y1 # flip values in case y2 is less than y1
    (y1..y2).each do |y|
      set_pixel_color(x: x, y: y, color: color)
    end
  end

  def draw_horizontal_line(y:, x1:, x2:, color:)
    x1, x2 = x2, x1 if x2 < x1 # flip values in case x2 is less than x1
    (x1..x2).each do |x|
      set_pixel_color(x: x, y: y, color: color)
    end
  end
end
