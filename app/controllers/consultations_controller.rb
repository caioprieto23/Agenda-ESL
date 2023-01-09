class ConsultationsController < ApplicationController
#   before_action :set_consultation, only: %i[ new show edit update destroy ]

  def index
    @consultations = Consultation.all
    @consultation = Consultation.new
  end

  def show
    @consultations = Consultation.all
  end

  def new
    # @consultation = current_user.consultations.build
        @consultation = Consultation.new
        @datePass = params[:start_time]
        @timePass = params[:end_time]
        @consultation.start_time = @datePass
        @consultation.end_time = @timePass
        @currentTime = Time.zone.now
  end

  def edit
    @consultation = Consultation.find(params[:id])
  end

  def create
    @consultation = Consultation.new(consultation_params)

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to consultations_path }
        format.json { render :home, status: :created, location: @consultation } 
        flash[:notice] = "Reunião foi criada com sucesso." 
      else
        format.html { redirect_to consultations_path }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
        flash[:notice] = "Erro na criação da reunião." 
      end
    end
  end

  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        @consultation = Consultation.find(params[:id])
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
   
    # def set_consultation
    #     @consultation = Consultation.find(params[:id])
    # end

    def consultation_params
      params.require(:consultation).permit(:user, :title, :description, :start_time, :end_time)
    end
end
