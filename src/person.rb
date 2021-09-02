require './src/atm'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = name
    set_name(attrs[:name])
    @cash = 1000
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)

    # @account.set_expire_date
  end

  def deposit(amount)
    @account.nil? ? missing_name : deposit_funds(amount)
    # binding.pry
  end

  private

  # binding.pry
  # To call upon a attribute of the Account Class, type @account.attribute
  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
    # binding.pry
  end

  def set_name(obj)
    obj.nil? ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end
end
