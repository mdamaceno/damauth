module Damauth
  module Admin
    class UsersController < Damauth::ApplicationController
      @@user = User
      @@user_validation = Damauth::UserValidations.new

      def new
      end

      def create
        if @@user_validation.check_if_registered(user_params)
          return error_if_already_regitered
        end

        if @@user_validation.check_diff_password(user_params)
          return error_if_password_does_not_match
        end

        if @@user_validation.validate_user(user_params).messages.empty?
          user = @@user.new(user_params)
          user.username = SecureRandom.hex(10)

          save_or_not(user)
        else
          error_validation
        end
      end

      protected

      def error_if_already_regitered
        flash[:alert] = 'Email já cadastrado!'
        redirect_to admin_signup_path
      end

      def error_if_password_does_not_match
        flash[:alert] = 'Senha não confirmada!'
        redirect_to admin_signup_path
      end

      def error_validation
        flash[:validation] = @@user_validation.validate_user(user_params)
                                              .messages(full: true, locale: :'pt-BR')
        render :new
      end

      def save_or_not(user)
        if user.save
          session[:user_id] = user.id
          redirect_to '/'
        else
          render :new
        end
      end

      private

      def user_params
        params.require(:user).permit!
      end
    end
  end
end
