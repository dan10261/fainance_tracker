class StocksController < ApplicationController
  def  search
  
    if params[:stock].blank?
          flash.now[:danger] = "Please enter a symbol."
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Your symbol is invalid." unless @stock
    end  
    #byebug
    #render partial: 'users/search_result' #rails 4
    respond_to do |format|
       format.js { render partial: 'users/search_result' }
    end
  end
end