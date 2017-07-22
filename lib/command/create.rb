require_relative "base"
class Create < Base

  def initialize(command)
    @command = command
    @errors = nil
    matches
  end

  def valid?
    if RANGE.include?(cols) && RANGE.include?(rows)
      @result = { n: cols, m: rows }
      true
    else
      @errors = { errors: [] }
      false
    end
  end

  private

  def matches
    @m = /\A(I)\s{1}(\d{1,3})\s{1}(\d{1,3})\z/.match(command)
  end

  def cols
    m && m[2] ? m[2].to_i : 0
  end

  def rows
    m && m[3] ? m[3].to_i : 0
  end
end
