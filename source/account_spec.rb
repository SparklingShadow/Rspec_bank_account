require "rspec"

require_relative "account"

describe Account do
  let(:account) { Account.new("1029384756",900)}
  
  describe "#initialize" do
  
    it "should "
      account.should be_an_instance_of Account
  end

  describe "#transactions" do

    it "Transactions should be an array" do
      account.transactions.class.should eq Array
    end

    it "Transactions size should be one" do
      account.transactions.size.should eq 1
    end
  end

  describe "#balance" do

    it "Starting balance should equal 900" do
      account.balance.should eq 900
    end

    it "The updated balance should be returned" do
      expect ([900,100].sum).to eq(1000)
    end
  end
 
  describe "#account_number" do
    
    it "Only the last four numbers should show" do
      account.acct_number.should eq "******4756"
    end

  end

  describe "deposit!" do

    it "An element should be added to the transaction array" do
      account.deposit!(100)
      account.transactions.length.should eq 2
    end

    it "should not pass when given a negative input" do
      expect {
        account.deposit!(-100)
      }.to raise_error(DepositError)
    end

    it "should not accept more than one argument" do
      expect {
        account.deposit!(900, 2000)
      }.to raise_error(TooManyArgumentsError)
    end

  end

  describe "#withdraw!" do

    it "Transaction array should have an element added" do
      account.withdraw!(10)
      account.withdraw!(20)
      account.transactions.length.should eq 3
    end

    it "should raise error if overdraft" do
      expect {
        account.withdraw!(200)
      }.to raise_error(OverdraftError)
    end

  end
end
