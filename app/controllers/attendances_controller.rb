# frozen-string-literal: true

# Training attendance for all players.
class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :update]

  def index
    @attendances = Attendance.all
    json_response(@attendances)
  end

  def create
    @attendance = Attendance.create!(attendance_params)
    json_response(@attendance, :created)
  end

  def show
    json_response(@attendance)
  end

  def update
    if @attendance.update(attendance_params)
      json_response(@attendance, :updated)
    end
  end

  private

  def set_attendance
    puts @attendance
    puts params[:id]
    @attendance = Attendance.find(attendance_params[:id])
  end

  def attendance_params
    params.permit(:id, :player_id, :training_id, :reason, :participant)
  end
end
