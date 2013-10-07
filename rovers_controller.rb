# A controller class to manage a set of rovers on a given plateau. Rovers and Plateau  objects are created with relevent methods in the class.


class RoversControl

  attr_accessor :instructions, :plateau, :rovers

  # Parse the options hash
  # @instructions is the current instruction set being followed
  def initialize(params = {})
    @instructions = params.fetch(:instructions)
  end

  # Maps a new plateau with the coordinates supplied in @instructions. Create a @plateau object accessible from this controller
  def map_plateau
    coords = instructions[0]
    @plateau = Plateau.new(coords)
  end

  # Prepare a new set of Rovers with initial positions and routes to follow. Instructions are taken from the current set of instructions, @instructions
  def prepare_rovers
    @rovers = Array.new
    rover_instructions = Array.new(@instructions)
    rover_instructions.shift
    rover_instructions.each_slice(2) do |instruction_block|
      position, route = instruction_block
      @rovers << Rover.new(position: position, instructions: route, map: @plateau)
    end
  end

  # Deploy all rovers, in turn. Each one will follow it's latest instructions
  def deploy_rovers
    @rovers.each do |rover|
      rover.execute_instructions
    end
  end

  # Create a status report containing the current positions of each rover
  def status_report
    report = Array.new
    @rovers.each do |rover|
      report << "#{rover}"
    end
    return [report]
  end

end
