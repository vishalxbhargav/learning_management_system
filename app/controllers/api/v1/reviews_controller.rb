class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [ :index, :create  ]
  before_action :set_review, only: [ :update, :show, :destroy ]

  def index
    @reviews=@user.reviews
    if @reviews.any?
      render json: @reviews, status: 200
    else
      render json: { message: "user don't have reviews" }, status: 500
    end
  end
  def show
    render json: @review, status: 200
  end
  def create
    debugger
    @review=@user.reviews.new(review_params)
    if @review.save
      render json: { message: "review created" }, status: 201
    else
      render json: @review.errors, status: 500
    end
  end
  def update
    if @review.update(review_params)
      render json: { message: "review updated successfully" }, status: 200
    else
      render json: @review.errors, status: 500
    end
  end
  def destroy
    if @review.destroy
      render json: { message: "review deleted" }
    else
      render json: { message: @review.errors }, status: 500
    end
  end
  private
  def set_review
    @review=Review.find_by(id: params[:id])
    render json: { message: "review not found" }, status: 404 if @review.nil?
  end
  def review_params
    params.expect(review: [ :title, :contenet, :rating, :status, :course_id ])
  end
  def set_user
    @user=User.find_by(id: params[:user_id].to_i)
    render json: { message: "user not found" }, status: 404 unless @review.nil?
  end
end
