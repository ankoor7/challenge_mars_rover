class RoversControl

  attr_accessor :instructions, :plateau

  def initialize(params = {})
    @instructions = params.fetch(:instructions)
  end


  def map_plateau
    coords = instructions[0]
    @plateau = Plateau.new(coords)
  end

end
