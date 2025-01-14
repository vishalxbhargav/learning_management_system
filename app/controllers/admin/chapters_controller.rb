class Admin::ChaptersController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @chapter = @course.chapters.new
  end
  def create
    @chapter=Chapter.new(chapter_params)
    if @chapter.save
      @chapter
    else
      @chapter
    end
  end
  private
  def chapter_params
    debugger
    hash = params.require(:chapter).permit(:name, :content)
    hash.merge!(course_id: params[:course_id])
    hash
  end
end
