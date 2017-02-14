class UsersController < ApplicationController
  def index
    @user = User.all

    render json: @user
  end

  # def new
  #   render text: "I'm in da new action!"
  # end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
      json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  # def edit
  #   render text: "I'm in da edit action!"
  # end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render(
      json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.destroy(params[:id])
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
