# An object class to model a rover on a given plateau. The rover moves forward, left and right. It tracks its position as coordinates within its Plateau given by the @map variable. It records it direction with each movement.

class Rover

  attr_accessor :instructions, :direction, :position, :log

  # Hash to map direction instructions to the appropriate vector for movement
  @@move = {  :E => [1,0],
                        :W => [-1,0],
                        :N => [0,1],
                        :S => [0,-1]
                     }

  # An array of possible movement commands
  @@compass = [:N,:E,:S,:W]

  def initialize(params = {})
    pos_data = params.fetch(:position).split
    @position = [pos_data[0].to_i, pos_data[1].to_i]
    @direction =  pos_data[2].to_sym
    @instructions = params.fetch(:instructions)
    @map = params.fetch(:map)
    @log = []
  end

  # Executes the current instruction set
  def execute_instructions
    @instructions.split('').each do |instruction|
      case instruction
      when "L" then turn_left
      when "R" then turn_right
      when "M" then engage_engine
      end
    end
  end

  # Prints a string suitable for the results
  def to_s
    "#{position[0]} #{position[1]} #{@direction}"
  end

  # Moves the rover one square in the current direction it is facing
  def engage_engine
    if @map.contains(new_coord)
      @position = new_coord
    else
      @log.push "#{new_coord} is out of bounds. please check instructions"
    end
  end

  # Calcualate the new coordinate for a given movement
  def new_coord
    [@position, @@move[@direction]].transpose.map { |coord|  coord.reduce(:+) }
  end

  # Turns the rover left
  def turn_left
    if @@compass.index(@direction) == 0
      @direction = @@compass[-1]
    else
      current_index = @@compass.index(@direction)
      @direction = @@compass[current_index - 1]
    end
  end

  # Turns the rover right
  def turn_right
    if @@compass.index(@direction) == @@compass.length - 1
      @direction = @@compass[0]
    else
      current_index = @@compass.index(@direction)
      @direction = @@compass[current_index + 1]
    end
  end

end
