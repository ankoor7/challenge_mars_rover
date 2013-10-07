# Batch file to run the challenge and print the answer to STDOUT

require_relative 'comms'
require_relative 'rovers_controller'
require_relative 'plateau'
require_relative 'rover'
require 'pry'

file = "/Users/ankoor/Code/tests/mars_rover/input.txt"

comms = Comms.new
instructions = comms.parse(file)

control = RoversControl.new(instructions: instructions)
control.map_plateau
control.prepare_rovers
control.deploy_rovers
comms.send(control.status_report)
