class NullBitmap
  def created?
    false
  end

  def draw
    bitmap_missing
  end

  def max_x
    bitmap_missing
  end

  def max_y
    bitmap_missing
  end

  def reset!
    bitmap_missing
  end

  private

  def bitmap_missing
    raise("Please create a bitmap first!")
  end
end
