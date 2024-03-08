class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by({ "id" => params["id"] })
  end

  def create
    if User.find_by({ "email" => params["email"] }) == nil
      @user = User.new
      @user["username"] = params["username"]
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      flash["notice"] = "Successful sign-up."
      redirect_to "/login"
    else 
    flash["notice"] = "Use another email."
      redirect_to "/signup"
    end 
  end
end