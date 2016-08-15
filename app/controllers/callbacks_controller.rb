class CallbacksController < ApplicationController

  def twitter
    twitter_data = request.env['omniauth.auth']
    aauser = Aauser.find_or_create_from_twitter twitter_data
    sign_in(aauser)
    redirect_to root_path, notice: "Thanks for signing in with Twitter"
  end



end
