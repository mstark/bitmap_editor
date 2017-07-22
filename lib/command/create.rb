require_relative "base"
class Create < Base

  def initialize(command)
    @command = command
    @errors = []
    @result = {}
    matches
  end

  def valid?
    @errors.push("Given values must be between 1 and 250.") unless in_range?

    if @errors.empty?
      @result = { n: cols, m: rows }
      true
    else
      false
    end
  end

  private

  def in_range?
    RANGE.include?(cols) && RANGE.include?(rows)
  end

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
