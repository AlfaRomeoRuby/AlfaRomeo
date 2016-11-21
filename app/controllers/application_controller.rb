class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
      # before_action :authenticate_user!

      layout :layout_by_resource

      protected

      def layout_by_resource
        if devise_controller?
          "public"
        else
          "public"
        end
      end
    #def current_user
    #    @current_user ||= User.find(session[:user_id]) if session[:user_id]
   # end

   # helper_method :current_user

  #  private

   def check_login
       if current_user && current_user.admin_role?
           return true
       else
           flash[:danger] = "Nie jesteś zalogowany jako administrator!"
           redirect_to(controller: 'public')
          #  redirect_to(controller: 'users', action: 'sign_in')
           return false
       end
   end
end
