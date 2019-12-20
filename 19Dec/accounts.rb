class Accounts
  attr_accessor :name ,:account_num , :amount
  
  def initialize(name)
    @@name = name
  end

  public
  def account_create
    @account_num = rand(10000) 
    puts "Your account number #{account_num}"
    puts "Deposit minimum of 1000 RS. Enter amount:"
    @amount = gets.chomp.to_i
    while @amount < 1000
      puts "Deposit atleast 1000"
      puts "Deposit minimum of 1000 RS. Enter amount:"
      @amount = gets.chomp.to_i
   end
  end

  def deposit
    puts "Enter Deposit Amount"
    deposit_amount = gets.chomp.to_i
    if(deposit_amount <= 0)
      p "Deposit amount is invalid .. Please enter valid amount"
      deposit
    else
    @amount = @amount + deposit_amount
    puts "#{deposit_amount} deposited"
    end
  end

  def withdraw
    puts "Enter Withdraw Amount"
    withdraw_amount = gets.chomp.to_i
    if(withdraw_amount <= 0)
      p "Withdraw amount is invalid .. Please enter valid amount"
    elsif @amount >= withdraw_amount
    @amount = @amount - withdraw_amount
    puts "#{withdraw_amount} Withdrawn"
    elsif @amount <= withdraw_amount 
      puts "Withdraw amount is greater than account balance"
    end
  end

  def get_balance
    puts "Account Number #{account_num}"
    puts "Account Holder Name #{@@name}"
    puts "Your account balance is #{amount}"
  end
end

class Savings < Accounts
  @@saving_rate = 5.6

  def initialize(months)
    @months = months
  end

  def account_create
    super
    puts "Saving Account Created"
  end

  def saving_calculate
    interest = (@months * @amount * @@saving_rate)/100
    print "Your interest rate is "
    puts interest
  end
end

class Current < Accounts
  @@current_rate = 4.8
  def initialize(months)
    @months = months
  end

  def account_create
    super
    puts "Current Account Created"
  end

  def current_calculate
    interest = (@months * @amount * @@current_rate)/100
    print "Your interest rate is "
    puts interest
  end
end

  a = Accounts.new("Preeti")

  puts "1.Savings"
  puts "2.Current"
  puts "Enter the account type you wish to create (1=Savings 2=Current) "
  account_type = gets.chomp.to_i

  case account_type
  when 1
    puts "Enter the total number of months "
    months = gets.chomp.to_i
    if months <= 0
      p "Enter Valid month"
    else
    s = Savings.new(months)
    s.account_create
    s.saving_calculate
    operation=1
    while operation >=1 && operation <=4
      puts "You would like to"
      puts "1.Deposit"
      puts "2.Withdraw"
      puts "3.Get Balance"
      puts "4.Exit"
      operation = gets.chomp.to_i
      case operation
      when 1
        s.deposit
        s.get_balance
      when 2
        s.withdraw
        s.get_balance
      when 3
        s.get_balance
      when 4
        exit
      else
        p "Invalid Choice of operation"
      end
    end
  end
  when 2
    puts "Enter the total number of months "
    months = gets.chomp.to_i
    c = Current.new(months)
    if months <= 0
      p "Enter Valid months"
    else
      c.account_create
      c.current_calculate
      operation=1
    while operation >=1 && operation <=4
      puts "You would like to"
      puts "1.Deposit"
      puts "2.Withdraw"
      puts "3.Get Balance"
      puts "4.Exit"
      operation = gets.chomp.to_i
      case operation
      when 1
        c.deposit
        c.get_balance
      when 2
        c.withdraw
        c.get_balance
      when 3
        c.get_balance
      when 4
        exit
      else
        p "Invalid Choice of operation"
      end
    end 
  end
end
        