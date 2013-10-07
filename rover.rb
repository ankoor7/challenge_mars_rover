class Rover

  attr_accessor :instructions, :direction, :position, :log

  @@move = {  :E => [1,0],
                        :W => [-1,0],
                        :N => [0,1],
                        :S => [0,-1]
                     }

  @@compass = [:N,:E,:S,:W]

  def initialize(params = {})
    pos_data = params.fetch(:position).split
    @position = [pos_data[0].to_i, pos_data[1].to_i]
    @direction =  pos_data[2].to_sym
    @instructions = params.fetch(:instructions)
    @map = params.fetch(:map)
    @log = []
  end

  def execute_instructions
    @instructions.split('').each do |instruction|
      case instruction
      when "L" then turn_left
      when "R" then turn_right
      when "M" then engage_engine
      end
    end
  end

  def to_s
    "#{position[0]} #{position[1]} #{@direction}"
  end

  def engage_engine
    if @map.contains(new_coord)
      @position = new_coord
    else
      @log.push "#{new_coord} is out of bounds. please check instructions"
    end
  end

  def new_coord
    [@position, @@move[@direction]].transpose.map { |coord|  coord.reduce(:+) }
  end

  def turn_left
    if @@compass.index(@direction) == 0
      @direction = @@compass[-1]
    else
      current_index = @@compass.index(@direction)
      @direction = @@compass[current_index - 1]
    end
  end

  def turn_right
    if @@compass.index(@direction) == @@compass.length - 1
      @direction = @@compass[0]
    else
      current_index = @@compass.index(@direction)
      @direction = @@compass[current_index + 1]
    end
  end

end
