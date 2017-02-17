class UsersController < ApplicationController

  def new
    @user = User.new(:role => "agent")
  end

  def create
  # @user = User.new(params[:user])
  #   if @user.save
  #     redirect_to root_path, notice: 'Sign up complete. Please check your inbox for activation email.'
  #   else
  #     render action: "new"
  #   end
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path, notice: 'Sign up complete. Please check your inbox for activation email.'
    else
      render action: “new”
    end
  end

  def activate
  @user = User.find_by_activation_code(params[:code])
  @user.activation_code = nil
    if @user.save
      redirect_to root_path, notice: "Activation complete. Welcome #{@user.name}"
    else
      render action: "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end
