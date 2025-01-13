class Admin::ChaptersController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @chapter = @course.chapters.new
  end
  def create
    debugger
    @chapter=Chapter.new(chapter_params)
    if @chapter.save
      @chapter
    else
      @chapter
    end
  end
  private
  def chapter_params
    params.expect(chapter: [ :name, :content, :course_id ])
  end
end
