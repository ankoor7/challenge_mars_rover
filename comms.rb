class Comms

  def parse(file)
    instruction_set = IO.readlines(file).map(&:chomp)
  end

  def send
  end

end
