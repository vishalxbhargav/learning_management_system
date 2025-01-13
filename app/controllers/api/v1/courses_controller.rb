class Api::V1::CoursesController<ApplicationController
  before_action :set_user, only: %i[index]
  def index
    @courses=@user.courses
    if @courses.any?
      render json: @courses, status: 200
    else
      render json: { message: "don't have any course for this user" }, status: 200
    end
  end
  def show
    @course=Course.find_by(id: params[:id])
    if @course.nil?
      render json: { message: "course not found " }, status: 404
    else
      render json: @course, status: 200
    end
  end
  def course_by_category
    @courses=Course.joins(:categories).where(categories: { name: params[:category] })
    if @courses.any?
      render json: @courses, status: 200
    else
      render json: @courses.errors, status: 200
    end
  end
  private
  def set_user
    @user=User.find_by(id: params[:user_id])
  end
end
