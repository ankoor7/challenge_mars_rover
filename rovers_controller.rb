# A controller class to manage a set of rovers on a given plateau. Rovers and Plateau  objects are created with relevent methods in the class.


class RoversControl

  attr_accessor :instructions, :plateau

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

end
