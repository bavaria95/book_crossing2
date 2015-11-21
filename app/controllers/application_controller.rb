class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :foo

  def foo
    if user_signed_in?
        

      @own_id = current_user.id
      all_transactions = Transaction.all
      @transactions_to_me = []
      # awful way to do that :/
      all_transactions.each do |t|
        if Book.find(t.requested_book_id).user_id == current_user.id and not t.status_requested
          @transactions_to_me << t
        end
      end
    end

  end
  protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :name, :surname, :city) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :name, :city) }
        end



        
end
