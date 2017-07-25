class Unknown < Base

  def initialize(command)
    @command = command
  end

  def call
    raise "Unrecognised command: #{line} :("
  end
end
