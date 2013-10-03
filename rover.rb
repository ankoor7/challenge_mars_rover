class Rover

  def initialize(params = {})
    @start_position = params.fetch(:position)
    @instructions = params.fetch(:instructions)
  end

end
