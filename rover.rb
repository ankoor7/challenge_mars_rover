class Rover

  attr_accessor :instructions, :direction, :position

  @@move = {  :E => [1,0],
                        :W => [-1,0],
                        :N => [0,1],
                        :S => [0,-1]
                     }

  def initialize(params = {})
    pos_data = params.fetch(:position).split
    @position = [pos_data[0].to_i, pos_data[1].to_i]
    @direction =  pos_data[2].to_sym
    @instructions = params.fetch(:instructions)
  end

  def engage_engine
    if new_coord.is_valid_position?
      @position = new_coord
    end
  end

  def new_coord
    [@position, @@move[@direction]].transpose.map { |coord|
      coord.reduce(:+) }
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

  def is_valid_position?
    true
  end

end
