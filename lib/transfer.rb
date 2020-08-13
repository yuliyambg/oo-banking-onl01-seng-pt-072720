class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  if sender.balance < amount || sender.status == "closed" || receiver.status == "closed"
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
  end 
  if self.status != "complete"
    sender.deposit(-amount)
    receiver.deposit(amount)
    self.status = "complete"
  end
end

end
