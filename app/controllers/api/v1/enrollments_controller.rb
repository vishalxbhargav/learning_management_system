class Api::V1::EnrollmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_enroll, only: [ :status, :status_update ]

  def create
    @enrollment = Enrollment.new(enroll_params)
    if @enrollment.save
      render json: { message: "User enrolled" }, status: 200
    else
      render json: @enrollment.errors, status: 500
    end
  end

  def status
    enrollment = Enrollment.find_by(enroll_params)
    if enrollment.nil?
      render json: { message: "Enrollment not found" }, status: 404
    else
      render json: { status: enrollment.status }, status: 200
    end
  end

  def status_update
    debugger
    enrollment = Enrollment.find_by(enroll_params)
    if enrollment.nil?
      render json: { message: "Enrollment not found" }, status: 404
    else
      enrollment.status = params[:status]
      if enrollment.save
        render json: { message: "Enrollment updated" }, status: 200
      else
        render json: enrollment.errors, status: 422
      end
    end
  end

  private

  def enroll_params
    params.expect(enrollment: [ :course_id, :user_id, :status ])
  end

  def set_enroll
    @enrollment = Enrollment.find_by(enroll_params)
    render json: { message: "Enrollment not found" }, status: 404 if @enrollment.nil?
  end
end
