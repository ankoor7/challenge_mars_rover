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

  it "does not move to invalid coordinates" do
    @instructions = "MM"
    @position = "5 5 N"
    @map = Plateau.new([5, 5])
    @rover = Rover.new(position: @position, instructions: @instructions, map: @map)
    @rover.engage_engine
    @rover.position.should eq [5,5]
  end

  it "steers left" do
    @rover.turn_left
    @rover.direction.should eq :W
    @rover.turn_left
    @rover.direction.should eq :S
    @rover.turn_left
    @rover.direction.should eq :E
    @rover.turn_left
    @rover.direction.should eq :N
  end

  it "steers right" do
    @rover.turn_right
    @rover.direction.should eq :E
    @rover.turn_right
    @rover.direction.should eq :S
    @rover.turn_right
    @rover.direction.should eq :W
    @rover.turn_right
    @rover.direction.should eq :N
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