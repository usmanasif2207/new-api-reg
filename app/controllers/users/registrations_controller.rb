class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
    before_action :authenticate_user!
    private
    def respond_with(resource, _opts = {})
      resource.persisted? ? register_success : register_failed
    end
    def register_success
      render json: {
      message: 'Signed up sucessfully.',
      user: current_user
    }, status: :ok
    end
    def register_failed
      render json: { message: 'Something went wrong.' }, status: :unprocessable_entity
    end
  end