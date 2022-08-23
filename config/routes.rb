Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  
  post "/users/updateUserPaymentStatus", to:"updatepayment#update"
end