class UserStocksController < ApplicationController
  def create
      user = User.find(params[:user_id])
      stock = Stock.find_by_ticker(params[:stock_ticker])
      if !stock
        stock = Stock.new_from_lookup(params[:stock_ticker])
        stock.save
      end      
      if  UserStock.create(user: user,stock: stock)
        flash[:success] = "Stock is successfully added."
      else
        flash[:danger] = "Stock failed."
      end
      redirect_to my_portfolio_path
  end
  
  def destroy
    user_stock =  UserStock.find( params[:id])
    user_stock.destroy
    flash[:success] = "Stock #{user_stock.stock.name} is successfully removed."
    redirect_to my_portfolio_path
  end
end
