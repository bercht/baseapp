class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @client = Client.from_omniauth(request.env["omniauth.auth"])
    if @client.persisted?
      sign_in_and_redirect @client, :event => :authentication
    else
    redirect_to new_client_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
