require 'spec_helper'

describe Rover do
  before :each do
    @instructions = "RMMLLMM"
    @position = "1 0 N"
    @map = Plateau.new([5, 5])
    @rover = Rover.new(position: @position, instructions: @instructions, map: @map)
  end

  it "accepts an string of instructions" do
    @rover.instructions.should match @instructions
  end

  it "accepts an initial position" do
    @rover.position.should == [1,0]
    @rover.direction.should eq :N
  end

  it "engages the engine to move" do
    @rover.engage_engine
    @rover.position.should eq [1,1]
  end

  it "calculates the coordinates for each movement" do
    @rover.new_coord.should eq [1,1]
    @rover.position.should eq [1,0]
  end

  it "checks if movements are valid" do
    pending
  end

  it "steers left and right" do
    pending
  end

  it "records its direction while steering" do
    pending
  end

  it "records its position while moving" do
    pending
  end

  it "prints a useful status report" do
    pending
  end



end