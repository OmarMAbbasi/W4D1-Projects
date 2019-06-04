class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = user_params
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show

    user = find_user_id
    render json: user
  end

  def update
    user = find_user_id
    user.update(email: params[:email])
    render json: user
  end
  
  def destroy
    user = find_user_id
    user.delete
    render json:user

  end
  private
  def find_user_id
    User.find(params[:id])
  end

  def user_params
    User.new(params.require(:user).permit(:name, :email))
  end

end