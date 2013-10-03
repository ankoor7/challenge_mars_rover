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

  end

  it "sends instructions to each rover in turn" do
  end

end