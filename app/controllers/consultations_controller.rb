class ConsultationsController < ApplicationController
  before_action :set_consultation, only: %i[ show edit update destroy ]

  def index
    @consultations = Consultation.all
    @consultation = Consultation.new
  end

  def show
    @consultations = Consultation.all
  end

  def new
    @consultation = Consultation.new
  end

  def edit
    @consultation = Consultation.find(params[:id])
  end

  def create
    @consultation = Consultation.new(consultation_params)

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to consultations_path, notice: "Reunião foi criada com sucesso." }
        format.json { render :home, status: :created, location: @consultation }
      else
        format.html { redirect_to root_path }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to consultations_path, notice: "Reunião foi atualizada com sucesso." }
        format.json { render :home, status: :ok, location: @consultation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @consultation.destroy

    respond_to do |format|
      format.html { redirect_to consultations_path, notice: "Reunião foi removida  com sucesso.." }
      format.json { head :no_content }
    end
  end

   private
   
    def set_consultation
        @consultation = Consultation.find(params[:id])
    end

    def consultation_params
      params.require(:consultation).permit(:title, :description, :start_time, :end_time)
    end
end
