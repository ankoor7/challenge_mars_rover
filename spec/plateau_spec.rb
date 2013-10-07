require 'spec_helper'

describe Plateau do
  before :each do
    @coords = [5,6]
    @plateau = Plateau.new(@coords)
  end

  it "gives assigns the correct x_max and y_max to the object" do
    expect([@plateau.x_max, @plateau.y_max]).to eq @coords
  end

  it "returns true if a given coordinate is on the plateau" do
    checks = [
                      [5,6],
                      [0,0],
                      [5,0],
                      [0,6],
                      [3,3]
                    ]
    checks.each do |coord|
      @plateau.contains(coord).should eq true
    end
  end

  it "returns false if a given coordinate is on the plateau" do
    checks = [
                      [5,7],
                      [0,-1],
                      [6,0],
                      [-1,6],
                      [30,30]
                    ]
    checks.each do |coord|
      @plateau.contains(coord).should eq false
    end
  end

end
