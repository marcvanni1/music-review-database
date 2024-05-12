class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to welcome_index_path
    else
      if params[:username].blank?
         @error = "Username field can not be blank"
      elsif User.where("username=:name", name: params[:username]).empty?
         @error = "User " + params[:username] + " does not exist."
      else
         @error = "Incorrect password"
      end
       render 'sessions/new'
    end
 end

 def destroy
    session.delete(:user_id)
    redirect_to welcome_index_path
 end
end
