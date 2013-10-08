require 'spec_helper'

describe Comms do
  before :each do
    @comm = Comms.new
  end

  describe "#parse" do
    it "puts the instructions into an array" do
      file = file = File.expand_path("input.txt")
      instructions = @comm.parse(file)
      expect(instructions).to be_an_instance_of Array
    end
  end

  describe "#send" do
    it "puts the status report to STDOUT" do
      data = ["line 1", "line 2", "line 3"]
      title = "Sample Title"
      sample_report = [title, data]
      STDOUT.should_receive(:puts).with(sample_report)
      @comm.send(sample_report)
    end
  end

end