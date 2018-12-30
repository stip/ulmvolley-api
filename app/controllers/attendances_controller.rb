# frozen-string-literal: true

# Training attendance for all players.
class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show]

  def index
    @attendances = Attendance.reduce(params)
    json_response(@attendances)
  end

  def create
    @attendance = Attendance.create!(attendance_params)
    json_response(@attendance, :created)
  end

  def show
    json_response(@attendance)
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.permit(:player_id, :training_id, :reason, :presence)
  end
end
