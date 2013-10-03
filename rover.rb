class Rover

  attr_accessor :instructions, :direction, :initial_position

  @@move = {  east: [1,0],
                        west: [-1,0],
                        north: [0,1],
                        south: [0,-1]
                     }

  def initialize(params = {})
    position = params.fetch(:position).split
    @initial_position = [position[0].to_i, position[1].to_i]
    @direction =  position[2].to_sym
    @instructions = params.fetch(:instructions)
  end

  def turn_left
    case @direction
    when :N
      @direction = :W
    when :E
      @direction = :N
    when :S
      @direction = :E
    when :W
      @direction = :S
    end
  end

  def turn_right
    case @direction
    when :N
      @direction = :E
    when :E
      @direction = :S
    when :S
      @direction = :W
    when :W
      @direction = :N
    end
  end

  def valid_move?
    true
  end

end
