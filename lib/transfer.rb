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
    return nil if @status == "complete"
    return "Transaction rejected. Please check your account balance." unless valid?

    @sender.deposit(-@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  end
end
