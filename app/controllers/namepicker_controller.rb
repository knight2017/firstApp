class NamepickerController < ApplicationController

  def index
  end

  def pick

    @names = params[:names]
    temp = @names.split(",")
    if temp.length > 0
    winner = Random.rand(temp.length)
    @winner = temp[winner]
    else
    @winner ="enter names"
    end
    render :index
  end

  
end
