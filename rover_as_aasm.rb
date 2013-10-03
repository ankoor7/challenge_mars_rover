class Rover
  include AASM

  def initialize(params = {})
    @position =  params.fetch(:position)
    @instructions = params.fetch(:instructions)
  end


  aasm do
    state :N, :S, :E, :W

    event :turn_left do
      case self.aasm_current_state
      when :N
        transitions :from => :N, :to => :W
      when :E
        transitions :from => :E, :to => :N
      when :S
        transitions :from => :S, :to => :E
      when :W
        transitions :from => :W, :to => :S
      end
    end

    event :turn_right do
      case self.aasm_current_state
      when :N
        transitions :from => :N, :to => :E
      when :E
        transitions :from => :E, :to => :S
      when :S
        transitions :from => :S, :to => :W
      when :W
        transitions :from => :W, :to => :N
      end
    end

  end

  def valid_move?
    true
  end

  end

end
