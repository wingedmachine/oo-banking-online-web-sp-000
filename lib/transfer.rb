class Transfer
  attr_reader :sender, :receiver, :status

  def initialize(sender, receiver, arg3)
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end
end
