require 'spec_helper'

describe RoversControl do
  before :each do
    file = "/Users/ankoor/Code/tests/mars_rover/input.txt"
    comms = Comms.new
    @instructions = comms.parse(file)
    @control = RoversControl.new(instructions: @instructions)
  end

  it "accepts an array of instructions" do
    expect(@control.instructions).to eq @instructions
  end

  it "makes a Plateau object with the correct x_max and y_max coordinates" do
    plateau = @control.map_plateau
    expect(plateau).to be_an_instance_of Plateau
  end

  it "creates a set of rovers" do
    @control.map_plateau
    @control.prepare_rovers
    expect(@control.rovers.length).to eq ((@instructions.length - 1) /2)
    expect(@control.rovers[0]).to be_an_instance_of Rover
  end

  it "starts each rover in turn" do
    pending
  end

end