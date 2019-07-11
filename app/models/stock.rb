class Stock < ApplicationRecord
#  has_many :user_stocks
  # has_many :users, through: :user_stocks
   
   
   def self.find_by_ticker(ticker_symbol)
     where(ticker: ticker_symbol).first
   end
    
    
   def self.new_from_lookup(ticker_symbol)
     begin
       client = IEX::Api::Client.new(publishable_token: 'pk_516a9c50e70f4676a432483cf1a17181')
       looked_up_stock = client.quote(ticker_symbol)
       new(name: looked_up_stock.company_name,
           ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
           rescue Exception => e
       return nil
     end
   end
end