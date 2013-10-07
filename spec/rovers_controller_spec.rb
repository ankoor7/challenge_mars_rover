require 'spec_helper'

describe RoversControl do
  before :each do
    file = "/Users/ankoor/Code/tests/mars_rover/input.txt"
    comms = Comms.new
    @instructions = comms.parse(file)
    @control = RoversControl.new(instructions: @instructions)
    @control.map_plateau
    @control.prepare_rovers
  end

  it "accepts an array of instructions" do
    expect(@control.instructions).to eq @instructions
  end

  it "makes a Plateau object with the correct x_max and y_max coordinates" do
    expect(@control.plateau).to be_an_instance_of Plateau
  end

  it "creates a set of rovers" do
    expect(@control.rovers.length).to eq ((@instructions.length - 1) /2)
    expect(@control.rovers[0]).to be_an_instance_of Rover
  end

  it "deploys each rover in turn" do
    @control.rovers[0].should_receive(:execute_instructions).once
    @control.rovers[-1].should_receive(:execute_instructions).once
    @control.deploy_rovers
  end

  it "calls the statius of each rover" do
    @control.rovers[0].should_receive(:to_s).once
    @control.rovers[-1].should_receive(:to_s).once
    @control.status_report
  end


end