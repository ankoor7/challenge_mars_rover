require 'spec_helper'

describe Comms do
  before :each do
    @comm = Comms.new
  end

  describe "#parse" do
    it "puts the instructions into an array" do
      file = "/Users/ankoor/Code/tests/mars_rover/input.txt"
      instructions = @comm.parse(file)
      expect(instructions).to be_an_instance_of Array
    end
  end

  describe "#send" do
    it "sends the status of each rover to the STDOUT" do
      pending
    end
  end

end