class BillController < ApplicationController


 def index
 end

 def split
   @amount = params[:amount].to_f
   @tax = params[:tax].to_f
   @tip = params[:tip].to_f
   @num = params[:numofppl].to_f
   @portion = (@amount + (@amount * @tax/100) + (@amount * @tip/100))/@num
   @result = @portion.to_s


   render :index
 end



end
