# This class has functions for communication between "NASA" and any controllers


class Comms
# Parse instruction file and return an array of single instruction blocks
  def parse(file)
    instruction_set = IO.readlines(file).map(&:chomp)
  end

  # function to send status reports and output to the NASA. (Or the screen in this case)
  def send
  end

end
