class Unknown
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def call
    raise "Unrecognised command: #{command.line} :("
  end
end
