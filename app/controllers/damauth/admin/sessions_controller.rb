module Damauth
  module Admin
    class SessionsController < Damauth::ApplicationController
      before_action :check_if_logged, only: [:new]

      @@session_validation = Damauth::SessionValidations.new

      def new
      end

      def create
        respond_to do |_format|
          if @@session_validation.validate_session(session_params).messages.empty?
            user = User.find_by_email(session_params[:email])
            # If the user exists AND the password entered is correct.
            if user && user.authenticate(session_params[:password])
              # Save the user id inside the browser cookie. This is how we keep the user
              # logged in when they navigate around our website.
              session[:user_id] = user.id
              _format.html { redirect_to '/' }
            else
              # If user's login doesn't work, send them back to the login form.
              _format.html { redirect_to admin_login_path, notice: 'Usuário ou senha incorretos' }
            end
          else
            _format.html do
              redirect_to admin_login_path, alert: @@session_validation
                .validate_session(session_params)
                .messages(locale: :'pt-BR')
            end
          end
        end
      end

      def destroy
        session[:user_id] = nil
        respond_to do |_format|
          _format.html { redirect_to admin_login_path }
        end
      end

      private

      def session_params
        params.require(:user).permit!
      end
    end
  end
end
