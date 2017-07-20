class Line
  attr_reader :m, :command

  def initialize(command, bitmap)
    @command = command
    @bitmap = bitmap
    @errors = nil
    matches
  end

  def result
    @result || {}
  end

  def errors
    @errors || []
  end

  private

  def in_range?
    Command::RANGE.include?(from) && Command::RANGE.include?(to)
  end

  def color?
    Command::COLOR.include?(color)
  end

  def color
    m && m[5] ? m[5] : ""
  end

end