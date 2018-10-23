class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? and @receiver.valid?
  end

  def execute_transaction
    if @status == "complete" return { nil }

    @sender.deposit(-@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  end
end
