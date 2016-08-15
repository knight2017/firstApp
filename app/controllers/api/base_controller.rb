class Api::BaseController < ApplicationController
  before_action :authenticate_api_aauser
  protect_from_forgery with: :null_session


private

  def authenticate_api_aauser
    @aauser = Aauser.find_by_api_key params[:api_key]
    head :forbidden unless @aauser
  end


end
