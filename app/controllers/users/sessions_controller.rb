class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
    respond_to :json
    private
    def respond_with(resource, _opts = {})
      render json: {
        message: 'You are logged in.',
        user: current_user},
        status: :ok
    end

    def respond_to_on_destroy
      current_user.present? ?   log_out_failure : log_out_success
    end
    def log_out_success
      render json: { message: "Logged out.", status: 200 }, status: :ok
    end
    def log_out_failure
      render json: { message: "Logged out failure.", status: 500 }, status: :ok
    end
  end