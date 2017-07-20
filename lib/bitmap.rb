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
        row += row_color(x: x + 1, y: y + 1)
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

  def draw_vertical_line(x:, from:, to:, color:)
    from, to = to, from if to < from # flip values in case to is less than from
    (from..to).each do |y|
      set_pixel_color(x: x, y: y, color: color)
    end
  end

  def draw_horizontal_line(y:, from:, to:, color:)
    from, to = to, from if to < from # flip values in case to is less than from
    (from..to).each do |x|
      set_pixel_color(x: x, y: y, color: color)
    end
  end

  private

  def row_color(x:, y:)
    pos = [x, y].join("-")
    if colors.has_key?(pos)
      colors[pos]
    else
      @base_color
    end
  end
end
