# This class has functions for communication between "NASA" and any controllers

# = Communication Error
# This is raised if invalid commands are recieved from HQ
class CommsError < StandardError
end

# = Communications
# Communication class to handle data input and output
class Comms
# Parse instruction file and return an array of single instruction blocks
  def parse(file)
    @instruction_set = IO.readlines(file).map(&:chomp)
    check_rover_instruction_set
    return @instruction_set
  end

  # function to send status reports and output to the NASA. (Or the screen in this case)
  def send(report)
    puts report
  end

  # Function to check the incoming instruction set. Allowed characters are: M, L, R, N, S, E, W, spaces and digits. Returns a CommsError if invalid characters are present
  private
  def check_rover_instruction_set
    @instruction_set.each do |line|
      line.split('').each do |element|
        begin
        raise CommsError, "invalid command in instruction set" unless element =~ /[MLRNSEW\s\d]/
        rescue => e
          p e.message
        end
      end
    end
  end

end
