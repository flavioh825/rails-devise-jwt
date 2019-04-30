class Api::V1::PatientsController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def index
    @patients = Patient.all
    render json: @patients
  end

  def show
    @patient = load_patient
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.valid? && @patient.save
      render json: @patient, status: 200
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  private

  def load_patient
    Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:email, :password, :mother_name)
  end
end