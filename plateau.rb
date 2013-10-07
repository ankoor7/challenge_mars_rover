# Represents the plateau on which the rovers are placed

class Plateau
  # Maximum values of x and y coordinates
  attr_reader :x_max, :y_max


  # Assign the supplied coordinates to x and y variables. The function takes the coordinates as an Array, e.g. [x,y]
  def initialize(coords)
    @x_max = coords[0].to_i
    @y_max = coords[1].to_i
  end

  # Function to check if a supplied coordinate is on the Plateau. the coordiante is supplied in the format, [x,y]
  def contains(coodinate)
    coodinate[0] <= x_max && coodinate[0] >= 0 && coodinate[1] <= y_max && coodinate[1] >= 0
  end
end

