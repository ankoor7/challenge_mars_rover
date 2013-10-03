require 'spec_helper'

describe Plateau do
  before :each do
    @coords = [5,6]
    @plateau = Plateau.new(@coords)
  end

  it "gives assigns the correct x_max and y_max to the object" do
    expect([@plateau.x_max, @plateau.y_max]).to eq @coords
  end

end
