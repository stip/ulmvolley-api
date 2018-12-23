class TrainingsController < ApplicationController

  before_action :set_training, only: [:show]

  def index
    @trainings = Training.reduce(params)
    json_response(@trainings)
  end


  def create
    @training = Training.create!(training_params)
    json_response(@training, :created)
  end


  def show
    json_response(@training)
  end

  private

  def set_training
    @training = Training.find(params[:id])
  end

  def training_params
    params.permit( :at )
  end

end