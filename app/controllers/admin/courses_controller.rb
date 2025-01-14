class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course,only: [:show, :edit,:destroy]
  def index
    @courses=Course.all
  end
  def show
    @course
  end
  def new
    @course=Course.new
  end
  def create
    @course=Course.new(course_params)
    if @course.save
        render :index
    else
        render :new
    end
  end
  def edit
    @course
  end
  def update
    debugger
    if @course.update(course_params)
    end
  end
  def destroy
  end
  private
  def set_course
    @course=Course.find_by(params[:course_id])
  end
  def course_params
    params.expect(course: [ :title, :duration, :price ])
  end
end
