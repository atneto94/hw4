class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    #Check User
    if @user != nil
      # Check Password
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome!"
        redirect_to "/places"
      else
        flash["notice"] = "Wrong login or password"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Wrong login or password"
      redirect_to "/login"
  end
  
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Bye."
    redirect_to "/login"
  end
end
  