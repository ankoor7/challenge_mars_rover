# Represents the plateau on which the rovers are placed

class Plateau
  # Maximum values of x and y coordinates
  attr_reader :x_max, :y_max


  # Assign the supplied coordinates to x and y variables
  def initialize(coords)
    @x_max = coords[0]
    @y_max = coords[1]
  end


end

