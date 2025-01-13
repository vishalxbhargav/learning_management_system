class Admin::CoursesController < ApplicationController
  def index
    @courses=Course.all
  end
  def show
    @course=Course.find(params[:id])
  end
  def new
    @course=Course.new
  end
  def create
    @course=Course.new(course_params)
    if @course.save
        render :index
    else
        render :index
    end
  end
  def edit
    @course
  end
  private
  def course_params
    params.expect(course: [ :title, :duration, :price ])
  end
end
