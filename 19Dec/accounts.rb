class Accounts
  protected
  attr_accessor :name , :account_num , :amount
  
  def initialize(name)
    @name = name
  end
  public
  def account_create
    @account_num = rand(10000) 
    puts "Your account number #{account_num}"
    puts "Deposit minimum of 1000 RS. Enter amount:"
    @amount = gets.chomp.to_i
    if @amount < 1000
      puts "Deposit atleast 1000"
      puts "Deposit minimum of 1000 RS. Enter amount:"
      @amount = gets.chomp.to_i
   end
  end

  def deposit
    puts "Enter Deposit Amount"
    deposit_amount = gets.chomp.to_i
    @amount = @amount + deposit_amount
    puts "#{deposit_amount} deposited"
  end

  def withdraw
    puts "Enter Withdraw Amount"
    withdraw_amount = gets.chomp.to_i
    if @amount >= withdraw_amount
    @amount = @amount - withdraw_amount
    puts "#{withdraw_amount} Withdrawn"
    else 
      puts "Withdraw amount is greater than account balance"
    end
  end

  def get_balance
    puts "Your account balance is #{@amount}"
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
  @@current = 4.8
  def initialize(months)
    @months = months
  end

  def account_create
    super
    puts "Current Account Created"
  end

  def current_calculate
    interest = (@months * @amount * @@saving_rate)/100
    print "Your interest rate is "
    puts interest
  end

end

  a = Accounts.new("Preeti")

  puts "1.Savings"
  puts "2.Current"
  puts "Enter the account type you wish to create (1=Savings 2=Current) "
  type = gets.chomp.to_i

  if type==1
    puts "Enter the total number of months "
    month = gets.chomp.to_i
    s = Savings.new(month)
    s.account_create
    s.saving_calculate
    operation=0
    while operation!=4
      puts "You would like to"
      puts "1.Deposit"
      puts "2.Withdraw"
      puts "3.Get Balance"
      puts "4.Exit"

      operation = gets.chomp.to_i
      if operation==1
        s.deposit
        s.get_balance
      elsif operation==2
        s.withdraw
        s.get_balance
      elsif operation==3
        s.get_balance
      end
    end
  elsif type==2
    puts "Enter the total number of months "
    month = gets.chomp.to_i
    s = Current.new(month)
    s.account_create
    s.saving_calculate
    operation=0
    while operation!=4
      puts "You would like to"
      puts "1.Deposit"
      puts "2.Withdraw"
      puts "3.Get Balance"
      puts "4.Exit"

      operation = gets.chomp.to_i
      if operation==1
        s.deposit
        s.get_balance
      elsif operation==2
        s.withdraw
        s.get_balance
      elsif operation==3
        s.get_balance
      end
    end
  else
    puts "Invalid Selection"
end

    