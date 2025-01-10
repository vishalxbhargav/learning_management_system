class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [ :show, :update ]
  def index
    @users=User.all
    render json: { data: @users }, status: :ok
  end
  def show
    render json: { data: @user }
  end
  def create
    @user=User.new(user_params)
    if @user.save 
        render json: { message: "user successfully created", token: "xyz" }
    else
       render json:  @user.errors, status: 401
    end
  end
  def update 
    if @user.update(user_params)
        render json: { message: "user successfully updated" }, status: 201
    else
       render json:  @user.errors, status: 401
    end
  end
  private
  def user_params
    params.expect(user: [ :username, :password, :email, :password_confirmation ])
  end
  def set_user
    @user=User.find_by(id: params[:id])
    render json: { message: "User not found" }, status: :not_found if @user.nil?
  end
end
