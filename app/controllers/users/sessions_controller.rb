class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  respond_to :json

  # def create
  #   byebug
    
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message!(:notice, :signed_in)
  #   #@user = User.find(:email => self.resource.email)
  #   resource.present? ? show_failure : show_success
  # end
 
  private

  def respond_with(resource, _opts = {})
    render json: {
      message: 'You are logged in.',
      jwt: current_token,
      user: current_user, status: 200},
      status: :ok
  end

  def respond_to_on_destroy
    current_user.present? ? log_out_failure : log_out_success
  end

  def log_out_success
    render json: { message: "Logged out.", status: 200 }, status: :ok
  end
  
  def log_out_failure
    render json: { message: "Logged out failure.", status: 500 }, status: :ok
  end
  
  # def show_success
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end

  # def show_failure
  #   render json: { message: "Invalid username or password!", status: 401 }, status: :ok
  # end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end