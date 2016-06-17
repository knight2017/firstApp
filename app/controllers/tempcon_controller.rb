class TempconController < ApplicationController

def index
end

def convert
  @convert = (params[:tempf].to_f - 32)*5/9
  render :index
end



end
